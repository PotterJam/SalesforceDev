public with sharing class LeadRoundRobinService {

    private static final String LOG_PREFIX = 'LeadRoundRobinService';

    public class AssignmentResult {
        public Id assignedUserId;
        public String status;
        public String message;

        public AssignmentResult(Id userId, String status, String message) {
            this.assignedUserId = userId;
            this.status = status;
            this.message = message;
        }
    }

    public List<AssignmentResult> assignLeads(List<Id> leadIds, Id poolId) {
        List<AssignmentResult> results = new List<AssignmentResult>();

        Lead_Assignment_Pool__c pool = queryPoolForUpdate(poolId);

        List<Lead_Assignment_Member__c> availableMembers = [
            SELECT Id, User__c, Sort_Order__c, Max_Open_Leads__c
            FROM Lead_Assignment_Member__c
            WHERE Assignment_Pool__c = :poolId
            AND Is_Available__c = true
            ORDER BY Sort_Order__c ASC
        ];

        if (availableMembers.isEmpty()) {
            for (Id leadId : leadIds) {
                results.add(handleNoMembers(pool, leadId));
            }
            return results;
        }

        Map<Id, Integer> ownerLeadCounts = getOpenLeadCounts(availableMembers);
        Decimal currentIndex = pool.Last_Assigned_Index__c;

        List<Lead> leadsToUpdate = new List<Lead>();
        List<Lead_Assignment_Log__c> logsToInsert = new List<Lead_Assignment_Log__c>();

        for (Id leadId : leadIds) {
            AssignmentResult result = assignSingleLead(
                leadId, pool, availableMembers, ownerLeadCounts, currentIndex
            );
            results.add(result);

            if (result.status == 'Success') {
                leadsToUpdate.add(new Lead(Id = leadId, OwnerId = result.assignedUserId));
                currentIndex = getIndexForUser(availableMembers, result.assignedUserId);
                ownerLeadCounts.put(
                    result.assignedUserId,
                    (ownerLeadCounts.containsKey(result.assignedUserId)
                        ? ownerLeadCounts.get(result.assignedUserId) : 0) + 1
                );
            } else if (result.status == 'Fallback') {
                leadsToUpdate.add(new Lead(Id = leadId, OwnerId = result.assignedUserId));
            }

            logsToInsert.add(buildLog(poolId, leadId, result));
        }

        if (!leadsToUpdate.isEmpty()) {
            update leadsToUpdate;
        }

        pool.Last_Assigned_Index__c = currentIndex;
        update pool;

        if (!logsToInsert.isEmpty()) {
            insert logsToInsert;
        }

        return results;
    }

    public AssignmentResult assignLead(Id leadId, Id poolId) {
        List<AssignmentResult> results = assignLeads(new List<Id>{ leadId }, poolId);
        return results[0];
    }

    private Lead_Assignment_Pool__c queryPoolForUpdate(Id poolId) {
        List<Lead_Assignment_Pool__c> pools = [
            SELECT Id, Is_Active__c, Last_Assigned_Index__c, Fallback_Owner__c, Pool_Name__c
            FROM Lead_Assignment_Pool__c
            WHERE Id = :poolId
            FOR UPDATE
        ];

        if (pools.isEmpty()) {
            throw new LeadRoundRobinServiceException(
                LOG_PREFIX + ': Pool not found with Id ' + poolId
            );
        }

        Lead_Assignment_Pool__c pool = pools[0];
        if (!pool.Is_Active__c) {
            throw new LeadRoundRobinServiceException(
                LOG_PREFIX + ': Pool "' + pool.Pool_Name__c + '" is inactive'
            );
        }

        return pool;
    }

    private Map<Id, Integer> getOpenLeadCounts(List<Lead_Assignment_Member__c> members) {
        Set<Id> userIds = new Set<Id>();
        for (Lead_Assignment_Member__c member : members) {
            userIds.add(member.User__c);
        }

        Map<Id, Integer> counts = new Map<Id, Integer>();
        for (Id userId : userIds) {
            counts.put(userId, 0);
        }

        for (AggregateResult ar : [
            SELECT OwnerId, COUNT(Id) cnt
            FROM Lead
            WHERE OwnerId IN :userIds
            AND IsConverted = false
            AND Status != 'Closed - Not Converted'
            GROUP BY OwnerId
        ]) {
            counts.put((Id) ar.get('OwnerId'), (Integer) ar.get('cnt'));
        }

        return counts;
    }

    private AssignmentResult assignSingleLead(
        Id leadId,
        Lead_Assignment_Pool__c pool,
        List<Lead_Assignment_Member__c> members,
        Map<Id, Integer> ownerLeadCounts,
        Decimal currentIndex
    ) {
        Integer memberCount = members.size();
        Integer startAfterIndex = findStartPosition(members, currentIndex);

        for (Integer i = 0; i < memberCount; i++) {
            Integer pos = Math.mod(startAfterIndex + i, memberCount);
            Lead_Assignment_Member__c member = members[pos];

            Integer currentLeads = ownerLeadCounts.containsKey(member.User__c)
                ? ownerLeadCounts.get(member.User__c) : 0;
            Integer maxLeads = member.Max_Open_Leads__c != null
                ? member.Max_Open_Leads__c.intValue() : 50;

            if (currentLeads < maxLeads) {
                return new AssignmentResult(
                    member.User__c,
                    'Success',
                    'Assigned to pool member at sort order ' + member.Sort_Order__c
                );
            }
        }

        return handleNoMembers(pool, leadId);
    }

    private Integer findStartPosition(List<Lead_Assignment_Member__c> members, Decimal lastIndex) {
        for (Integer i = 0; i < members.size(); i++) {
            if (members[i].Sort_Order__c > lastIndex) {
                return i;
            }
        }
        return 0;
    }

    private Decimal getIndexForUser(List<Lead_Assignment_Member__c> members, Id userId) {
        for (Lead_Assignment_Member__c member : members) {
            if (member.User__c == userId) {
                return member.Sort_Order__c;
            }
        }
        return 0;
    }

    private AssignmentResult handleNoMembers(Lead_Assignment_Pool__c pool, Id leadId) {
        if (pool.Fallback_Owner__c != null) {
            return new AssignmentResult(
                pool.Fallback_Owner__c,
                'Fallback',
                'No eligible pool members available. Assigned to fallback owner.'
            );
        }

        return new AssignmentResult(
            null,
            'Error',
            'No eligible pool members available and no fallback owner configured on pool "' +
                pool.Pool_Name__c + '".'
        );
    }

    private Lead_Assignment_Log__c buildLog(Id poolId, Id leadId, AssignmentResult result) {
        return new Lead_Assignment_Log__c(
            Assignment_Pool__c = poolId,
            Lead__c = leadId,
            Assigned_To__c = result.assignedUserId,
            Status__c = result.status,
            Error_Message__c = result.message,
            Assigned_Date__c = Datetime.now()
        );
    }

    public class LeadRoundRobinServiceException extends Exception {}
}
