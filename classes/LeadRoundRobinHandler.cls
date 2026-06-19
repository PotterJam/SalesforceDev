public with sharing class LeadRoundRobinHandler {

    public static void handleBeforeInsert(List<Lead> newLeads) {
        List<Round_Robin_Group__c> activeGroups;
        try {
            activeGroups = [
                SELECT Id, Active__c, Last_Assigned_Index__c, Total_Assignments__c
                FROM Round_Robin_Group__c
                WHERE Active__c = true
                FOR UPDATE
            ];
        } catch (Exception e) {
            return;
        }

        if (activeGroups.isEmpty()) {
            return;
        }

        Round_Robin_Group__c grp = activeGroups[0];

        List<Round_Robin_Member__c> allMembers;
        try {
            allMembers = [
                SELECT Id, Queue_Id__c, Queue_Name__c, Active__c,
                       Sort_Order__c, Assignment_Count__c, Current_Load__c,
                       Max_Capacity__c, Last_Assigned_Date__c
                FROM Round_Robin_Member__c
                WHERE Round_Robin_Group__c = :grp.Id
                ORDER BY Sort_Order__c ASC
            ];
        } catch (Exception e) {
            logError(grp, e.getMessage());
            return;
        }

        List<Round_Robin_Member__c> eligibleMembers =
            LeadRoundRobinService.filterEligibleMembers(allMembers);

        if (eligibleMembers.isEmpty()) {
            logError(grp, 'No eligible members available for assignment.');
            return;
        }

        LeadRoundRobinService.AssignmentResult result;
        try {
            result = LeadRoundRobinService.getNextAssignments(
                grp, eligibleMembers, newLeads.size()
            );
        } catch (Exception e) {
            logError(grp, e.getMessage());
            return;
        }

        for (Integer i = 0; i < newLeads.size(); i++) {
            if (i < result.queueIds.size()) {
                newLeads[i].OwnerId = result.queueIds[i];
            }
        }

        grp.Last_Assigned_Index__c = result.newLastAssignedIndex;
        grp.Total_Assignments__c = (grp.Total_Assignments__c != null
            ? grp.Total_Assignments__c : 0) + result.queueIds.size();
        grp.Error_Message__c = null;
        grp.Last_Error_Date__c = null;

        List<Round_Robin_Member__c> membersToUpdate = new List<Round_Robin_Member__c>();
        for (Id memberId : result.memberAssignmentIncrements.keySet()) {
            Integer increment = result.memberAssignmentIncrements.get(memberId);
            for (Round_Robin_Member__c m : eligibleMembers) {
                if (m.Id == memberId) {
                    m.Assignment_Count__c = (m.Assignment_Count__c != null
                        ? m.Assignment_Count__c : 0) + increment;
                    m.Current_Load__c = (m.Current_Load__c != null
                        ? m.Current_Load__c : 0) + increment;
                    m.Last_Assigned_Date__c = Datetime.now();
                    membersToUpdate.add(m);
                    break;
                }
            }
        }

        System.enqueueJob(new RoundRobinTrackingQueueable(grp, membersToUpdate));
    }

    private static void logError(Round_Robin_Group__c grp, String message) {
        grp.Error_Message__c = message.length() > 255
            ? message.substring(0, 255) : message;
        grp.Last_Error_Date__c = Datetime.now();
        System.enqueueJob(new RoundRobinTrackingQueueable(grp, new List<Round_Robin_Member__c>()));
    }

    public class RoundRobinTrackingQueueable implements Queueable {
        private Round_Robin_Group__c groupRecord;
        private List<Round_Robin_Member__c> memberRecords;

        public RoundRobinTrackingQueueable(
            Round_Robin_Group__c groupRecord,
            List<Round_Robin_Member__c> memberRecords
        ) {
            this.groupRecord = groupRecord;
            this.memberRecords = memberRecords;
        }

        public void execute(QueueableContext context) {
            try {
                update this.groupRecord;
                if (!this.memberRecords.isEmpty()) {
                    update this.memberRecords;
                }
            } catch (Exception e) {
                System.debug(LoggingLevel.ERROR,
                    'LeadRoundRobinHandler.RoundRobinTrackingQueueable: ' + e.getMessage());
            }
        }
    }

    public class LeadRoundRobinHandlerException extends Exception {}
}
