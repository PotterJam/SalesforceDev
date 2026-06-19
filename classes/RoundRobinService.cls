public with sharing class RoundRobinService {

    public static void assignLeads(List<Lead> leads) {
        if (leads == null || leads.isEmpty()) {
            return;
        }

        List<Round_Robin_Queue__c> queues = [
            SELECT Id, Last_Assigned_Index__c
            FROM Round_Robin_Queue__c
            WHERE Active__c = true
            LIMIT 1
            FOR UPDATE
        ];

        if (queues.isEmpty()) {
            return;
        }

        Round_Robin_Queue__c queue = queues[0];

        List<Round_Robin_Member__c> members = [
            SELECT Id, User__c, Sort_Order__c, Assignment_Count__c
            FROM Round_Robin_Member__c
            WHERE Round_Robin_Queue__c = :queue.Id
                AND Is_Available__c = true
                AND User__r.IsActive = true
            ORDER BY Sort_Order__c ASC
        ];

        if (members.isEmpty()) {
            return;
        }

        Decimal currentIndex = queue.Last_Assigned_Index__c != null
            ? queue.Last_Assigned_Index__c
            : 0;

        Map<Id, Decimal> memberCountUpdates = new Map<Id, Decimal>();

        for (Lead ld : leads) {
            Round_Robin_Member__c assignee = getNextMember(members, currentIndex);
            ld.OwnerId = assignee.User__c;
            currentIndex = assignee.Sort_Order__c;

            Decimal count = memberCountUpdates.containsKey(assignee.Id)
                ? memberCountUpdates.get(assignee.Id)
                : (assignee.Assignment_Count__c != null ? assignee.Assignment_Count__c : 0);
            memberCountUpdates.put(assignee.Id, count + 1);
        }

        queue.Last_Assigned_Index__c = currentIndex;
        update queue;

        List<Round_Robin_Member__c> membersToUpdate = new List<Round_Robin_Member__c>();
        for (Id memberId : memberCountUpdates.keySet()) {
            membersToUpdate.add(new Round_Robin_Member__c(
                Id = memberId,
                Assignment_Count__c = memberCountUpdates.get(memberId)
            ));
        }
        update membersToUpdate;
    }

    private static Round_Robin_Member__c getNextMember(
        List<Round_Robin_Member__c> members,
        Decimal currentIndex
    ) {
        for (Round_Robin_Member__c member : members) {
            if (member.Sort_Order__c > currentIndex) {
                return member;
            }
        }
        return members[0];
    }
}
