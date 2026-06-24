public with sharing class RoundRobinService {

    private static final String LOG_PREFIX = 'RoundRobinService';
    private static final Integer MAX_RETRIES = 3;
    private static final Integer BATCH_SIZE = 200;

    @TestVisible
    private static Boolean isProcessing = false;

    @TestVisible
    private static Map<Integer, AssignmentResult> pendingResults = new Map<Integer, AssignmentResult>();

    public static void processLeadAssignments(List<Id> leadIds) {
        if (isProcessing || leadIds == null || leadIds.isEmpty()) {
            return;
        }
        isProcessing = true;

        try {
            List<Lead> leads = [
                SELECT Id, OwnerId, LeadSource, Country, Rating
                FROM Lead
                WHERE Id IN :leadIds
            ];

            if (leads.isEmpty()) {
                return;
            }

            List<Round_Robin_Group__c> groups = [
                SELECT Id, Active__c, Priority__c, Last_Assigned_Index__c,
                       Lead_Source_Criteria__c, Country_Criteria__c, Rating_Criteria__c
                FROM Round_Robin_Group__c
                WHERE Active__c = true
                FOR UPDATE
            ];
            sortGroupsByPriority(groups);

            if (groups.isEmpty()) {
                createSkippedLogs(leads, 'No active round-robin groups configured');
                return;
            }

            Set<Id> groupIds = new Set<Id>();
            for (Round_Robin_Group__c grp : groups) {
                groupIds.add(grp.Id);
            }

            List<Round_Robin_Member__c> allMembers = [
                SELECT Id, Group__c, User__c, Sort_Order__c, Is_Active__c
                FROM Round_Robin_Member__c
                WHERE Group__c IN :groupIds AND Is_Active__c = true
                ORDER BY Sort_Order__c ASC
            ];

            Map<Id, List<Round_Robin_Member__c>> membersByGroup = new Map<Id, List<Round_Robin_Member__c>>();
            for (Round_Robin_Member__c member : allMembers) {
                if (!membersByGroup.containsKey(member.Group__c)) {
                    membersByGroup.put(member.Group__c, new List<Round_Robin_Member__c>());
                }
                membersByGroup.get(member.Group__c).add(member);
            }

            List<Lead> leadsToUpdate = new List<Lead>();
            Map<Id, Round_Robin_Group__c> groupsToUpdate = new Map<Id, Round_Robin_Group__c>();
            List<Round_Robin_Log__c> logsToInsert = new List<Round_Robin_Log__c>();

            for (Lead ld : leads) {
                Round_Robin_Group__c matchedGroup = findMatchingGroup(ld, groups, membersByGroup);

                if (matchedGroup == null) {
                    logsToInsert.add(createLog(null, ld.Id, null, 'Skipped', 'No matching active group found'));
                    continue;
                }

                List<Round_Robin_Member__c> members = membersByGroup.get(matchedGroup.Id);
                if (members == null || members.isEmpty()) {
                    logsToInsert.add(createLog(matchedGroup.Id, ld.Id, null, 'Error', 'No active members in group'));
                    continue;
                }

                Integer lastIndex = matchedGroup.Last_Assigned_Index__c != null
                    ? Integer.valueOf(matchedGroup.Last_Assigned_Index__c) : 0;
                Integer nextIndex = Math.mod(lastIndex, members.size());
                Round_Robin_Member__c nextMember = members[nextIndex];

                ld.OwnerId = nextMember.User__c;
                leadsToUpdate.add(ld);

                Integer newIndex = nextIndex + 1;
                matchedGroup.Last_Assigned_Index__c = newIndex;
                groupsToUpdate.put(matchedGroup.Id, matchedGroup);

                logsToInsert.add(createLog(matchedGroup.Id, ld.Id, nextMember.User__c, 'Success', null));
            }

            if (!leadsToUpdate.isEmpty()) {
                update leadsToUpdate;
            }
            if (!groupsToUpdate.isEmpty()) {
                update groupsToUpdate.values();
            }
            if (!logsToInsert.isEmpty()) {
                insert logsToInsert;
            }
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, LOG_PREFIX + ': processLeadAssignments failed - ' + e.getMessage());
        } finally {
            isProcessing = false;
        }
    }

    private static Round_Robin_Log__c createLog(Id groupId, Id leadId, Id userId, String status, String errorMsg) {
        return new Round_Robin_Log__c(
            Group__c = groupId,
            Lead__c = leadId,
            Assigned_To__c = userId,
            Status__c = status,
            Error_Message__c = errorMsg,
            Assignment_Date__c = Datetime.now()
        );
    }

    private static void createSkippedLogs(List<Lead> leads, String message) {
        List<Round_Robin_Log__c> logs = new List<Round_Robin_Log__c>();
        for (Lead ld : leads) {
            logs.add(createLog(null, ld.Id, null, 'Skipped', message));
        }
        try {
            insert logs;
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, LOG_PREFIX + ': Failed to create skipped logs - ' + e.getMessage());
        }
    }

    public static void assignLeads(List<Lead> newLeads) {
        pendingResults.clear();

        List<Round_Robin_Group__c> groups;
        Map<Id, List<Round_Robin_Member__c>> membersByGroup;

        try {
            groups = [
                SELECT Id, Active__c, Priority__c, Last_Assigned_Index__c,
                       Lead_Source_Criteria__c, Country_Criteria__c, Rating_Criteria__c
                FROM Round_Robin_Group__c
                WHERE Active__c = true
                FOR UPDATE
            ];
            sortGroupsByPriority(groups);

            if (groups.isEmpty()) {
                return;
            }

            Set<Id> groupIds = new Set<Id>();
            for (Round_Robin_Group__c grp : groups) {
                groupIds.add(grp.Id);
            }

            List<Round_Robin_Member__c> allMembers = [
                SELECT Id, Group__c, User__c, Sort_Order__c, Is_Active__c
                FROM Round_Robin_Member__c
                WHERE Group__c IN :groupIds AND Is_Active__c = true
                ORDER BY Sort_Order__c ASC
            ];

            membersByGroup = new Map<Id, List<Round_Robin_Member__c>>();
            for (Round_Robin_Member__c member : allMembers) {
                if (!membersByGroup.containsKey(member.Group__c)) {
                    membersByGroup.put(member.Group__c, new List<Round_Robin_Member__c>());
                }
                membersByGroup.get(member.Group__c).add(member);
            }
        } catch (Exception e) {
            for (Integer i = 0; i < newLeads.size(); i++) {
                pendingResults.put(i, new AssignmentResult(null, null, null, 'Error', e.getMessage()));
            }
            return;
        }

        for (Integer i = 0; i < newLeads.size(); i++) {
            Lead ld = newLeads[i];
            try {
                Round_Robin_Group__c matchedGroup = findMatchingGroup(ld, groups, membersByGroup);

                if (matchedGroup == null) {
                    pendingResults.put(i, new AssignmentResult(null, null, null, 'Skipped', 'No matching active group found'));
                    continue;
                }

                List<Round_Robin_Member__c> members = membersByGroup.get(matchedGroup.Id);
                if (members == null || members.isEmpty()) {
                    pendingResults.put(i, new AssignmentResult(matchedGroup.Id, null, null, 'Error', 'No active members in group'));
                    continue;
                }

                Integer lastIndex = matchedGroup.Last_Assigned_Index__c != null
                    ? Integer.valueOf(matchedGroup.Last_Assigned_Index__c) : 0;
                Integer nextIndex = Math.mod(lastIndex, members.size());
                Round_Robin_Member__c nextMember = members[nextIndex];

                ld.OwnerId = nextMember.User__c;

                Integer newIndex = nextIndex + 1;
                matchedGroup.Last_Assigned_Index__c = newIndex;

                pendingResults.put(i, new AssignmentResult(
                    matchedGroup.Id, nextMember.User__c, newIndex, 'Success', null
                ));
            } catch (Exception e) {
                pendingResults.put(i, new AssignmentResult(null, null, null, 'Error', e.getMessage()));
            }
        }
    }

    public static void finalizeAssignments(List<Lead> newLeads) {
        if (pendingResults.isEmpty()) {
            return;
        }

        Map<Id, Round_Robin_Group__c> groupsToUpdate = new Map<Id, Round_Robin_Group__c>();
        List<Round_Robin_Log__c> logsToInsert = new List<Round_Robin_Log__c>();

        for (Integer i = 0; i < newLeads.size(); i++) {
            AssignmentResult result = pendingResults.get(i);
            if (result == null) {
                continue;
            }

            if (result.groupId != null && result.newIndex != null && result.status == 'Success') {
                groupsToUpdate.put(result.groupId, new Round_Robin_Group__c(
                    Id = result.groupId,
                    Last_Assigned_Index__c = result.newIndex
                ));
            }

            logsToInsert.add(new Round_Robin_Log__c(
                Group__c = result.groupId,
                Lead__c = newLeads[i].Id,
                Assigned_To__c = result.assignedUserId,
                Status__c = result.status,
                Error_Message__c = result.errorMessage,
                Assignment_Date__c = Datetime.now()
            ));
        }

        try {
            if (!groupsToUpdate.isEmpty()) {
                update groupsToUpdate.values();
            }
            if (!logsToInsert.isEmpty()) {
                insert logsToInsert;
            }
        } catch (Exception e) {
            System.debug(LoggingLevel.ERROR, LOG_PREFIX + ': Failed to finalize assignments - ' + e.getMessage());
        }

        pendingResults.clear();
    }

    private static void sortGroupsByPriority(List<Round_Robin_Group__c> groups) {
        for (Integer i = 0; i < groups.size() - 1; i++) {
            for (Integer j = i + 1; j < groups.size(); j++) {
                Decimal pi = groups[i].Priority__c != null ? groups[i].Priority__c : 999;
                Decimal pj = groups[j].Priority__c != null ? groups[j].Priority__c : 999;
                if (pj < pi) {
                    Round_Robin_Group__c temp = groups[i];
                    groups[i] = groups[j];
                    groups[j] = temp;
                }
            }
        }
    }

    private static Round_Robin_Group__c findMatchingGroup(
        Lead ld,
        List<Round_Robin_Group__c> groups,
        Map<Id, List<Round_Robin_Member__c>> membersByGroup
    ) {
        for (Round_Robin_Group__c grp : groups) {
            if (!membersByGroup.containsKey(grp.Id) || membersByGroup.get(grp.Id).isEmpty()) {
                continue;
            }

            if (!matchesCriteria(ld.LeadSource, grp.Lead_Source_Criteria__c)) {
                continue;
            }
            if (!matchesCriteria(ld.Country, grp.Country_Criteria__c)) {
                continue;
            }
            if (!matchesCriteria(ld.Rating, grp.Rating_Criteria__c)) {
                continue;
            }

            return grp;
        }
        return null;
    }

    private static Boolean matchesCriteria(String fieldValue, String criteriaStr) {
        if (String.isBlank(criteriaStr)) {
            return true;
        }

        if (String.isBlank(fieldValue)) {
            return false;
        }

        Set<String> allowedValues = new Set<String>();
        for (String val : criteriaStr.split(',')) {
            allowedValues.add(val.trim().toLowerCase());
        }
        return allowedValues.contains(fieldValue.toLowerCase());
    }

    public class AssignmentResult {
        public Id groupId;
        public Id assignedUserId;
        public Integer newIndex;
        public String status;
        public String errorMessage;

        public AssignmentResult(Id groupId, Id assignedUserId, Integer newIndex, String status, String errorMessage) {
            this.groupId = groupId;
            this.assignedUserId = assignedUserId;
            this.newIndex = newIndex;
            this.status = status;
            this.errorMessage = errorMessage;
        }
    }

    public class RoundRobinServiceException extends Exception {}
}
