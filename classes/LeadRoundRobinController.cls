public with sharing class LeadRoundRobinController {

    @AuraEnabled(cacheable=true)
    public static List<Lead_Assignment_Pool__c> getPools() {
        return [
            SELECT Id, Name, Pool_Name__c, Is_Active__c, Last_Assigned_Index__c,
                   Fallback_Owner__c, Fallback_Owner__r.Name
            FROM Lead_Assignment_Pool__c
            ORDER BY Pool_Name__c ASC
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<Lead_Assignment_Member__c> getPoolMembers(Id poolId) {
        return [
            SELECT Id, Name, User__c, User__r.Name, Sort_Order__c,
                   Is_Available__c, Max_Open_Leads__c
            FROM Lead_Assignment_Member__c
            WHERE Assignment_Pool__c = :poolId
            ORDER BY Sort_Order__c ASC
        ];
    }

    @AuraEnabled
    public static Lead_Assignment_Member__c addMember(Id poolId, Id userId, Integer sortOrder) {
        Lead_Assignment_Member__c member = new Lead_Assignment_Member__c(
            Assignment_Pool__c = poolId,
            User__c = userId,
            Sort_Order__c = sortOrder,
            Is_Available__c = true,
            Max_Open_Leads__c = 50
        );
        insert member;
        return [
            SELECT Id, Name, User__c, User__r.Name, Sort_Order__c,
                   Is_Available__c, Max_Open_Leads__c
            FROM Lead_Assignment_Member__c
            WHERE Id = :member.Id
        ];
    }

    @AuraEnabled
    public static void removeMember(Id memberId) {
        delete [SELECT Id FROM Lead_Assignment_Member__c WHERE Id = :memberId];
    }

    @AuraEnabled
    public static void toggleAvailability(Id memberId, Boolean isAvailable) {
        update new Lead_Assignment_Member__c(
            Id = memberId,
            Is_Available__c = isAvailable
        );
    }

    @AuraEnabled
    public static void updateCapacity(Id memberId, Integer maxLeads) {
        update new Lead_Assignment_Member__c(
            Id = memberId,
            Max_Open_Leads__c = maxLeads
        );
    }

    @AuraEnabled(cacheable=true)
    public static List<Lead_Assignment_Log__c> getRecentLogs(Id poolId, Integer limitCount) {
        Integer queryLimit = (limitCount != null && limitCount > 0) ? limitCount : 20;
        return [
            SELECT Id, Name, Lead__c, Lead__r.Name, Assigned_To__c, Assigned_To__r.Name,
                   Status__c, Error_Message__c, Assigned_Date__c
            FROM Lead_Assignment_Log__c
            WHERE Assignment_Pool__c = :poolId
            ORDER BY Assigned_Date__c DESC
            LIMIT :queryLimit
        ];
    }

    @AuraEnabled
    public static List<LeadRoundRobinHandler.HandlerResult> assignLeadsToPool(
        List<Id> leadIds, Id poolId
    ) {
        LeadRoundRobinHandler handler = new LeadRoundRobinHandler();
        return handler.handleAssignment(leadIds, poolId);
    }
}
