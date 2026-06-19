public with sharing class LeadRoundRobinController {

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Group__c> getGroups() {
        return [
            SELECT Id, Name, Active__c, Last_Assigned_Index__c,
                   Total_Assignments__c, Error_Message__c, Last_Error_Date__c
            FROM Round_Robin_Group__c
            ORDER BY Name ASC
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Member__c> getMembers(Id groupId) {
        return [
            SELECT Id, Name, Queue_Id__c, Queue_Name__c, Active__c,
                   Sort_Order__c, Assignment_Count__c, Last_Assigned_Date__c,
                   Max_Capacity__c, Current_Load__c
            FROM Round_Robin_Member__c
            WHERE Round_Robin_Group__c = :groupId
            ORDER BY Sort_Order__c ASC
        ];
    }

    @AuraEnabled
    public static void toggleGroupActive(Id groupId, Boolean isActive) {
        Round_Robin_Group__c grp = new Round_Robin_Group__c(
            Id = groupId,
            Active__c = isActive
        );
        update grp;
    }

    @AuraEnabled
    public static void toggleMemberActive(Id memberId, Boolean isActive) {
        Round_Robin_Member__c member = new Round_Robin_Member__c(
            Id = memberId,
            Active__c = isActive
        );
        update member;
    }

    @AuraEnabled
    public static void resetCounters(Id groupId) {
        Round_Robin_Group__c grp = new Round_Robin_Group__c(
            Id = groupId,
            Total_Assignments__c = 0,
            Last_Assigned_Index__c = 0,
            Error_Message__c = null,
            Last_Error_Date__c = null
        );
        update grp;

        List<Round_Robin_Member__c> members = [
            SELECT Id
            FROM Round_Robin_Member__c
            WHERE Round_Robin_Group__c = :groupId
        ];
        for (Round_Robin_Member__c m : members) {
            m.Assignment_Count__c = 0;
            m.Current_Load__c = 0;
            m.Last_Assigned_Date__c = null;
        }
        if (!members.isEmpty()) {
            update members;
        }
    }
}
