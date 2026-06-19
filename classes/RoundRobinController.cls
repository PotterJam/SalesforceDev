public with sharing class RoundRobinController {

    @AuraEnabled(cacheable=true)
    public static Round_Robin_Config__c getConfig() {
        List<Round_Robin_Config__c> configs = [
            SELECT Id, Name, Is_Active__c, Fallback_Owner__c, Description__c
            FROM Round_Robin_Config__c
            WHERE Is_Active__c = true
            LIMIT 1
        ];
        return configs.isEmpty() ? null : configs[0];
    }

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Member__c> getMembers(Id configId) {
        return [
            SELECT Id, Name, User__c, User__r.Name, Is_Available__c,
                   Sort_Order__c, Last_Assigned_Date__c, Assignment_Count__c
            FROM Round_Robin_Member__c
            WHERE Round_Robin_Config__c = :configId
            ORDER BY Sort_Order__c ASC
        ];
    }

    @AuraEnabled
    public static Round_Robin_Member__c saveMember(Round_Robin_Member__c member) {
        upsert member;
        return member;
    }

    @AuraEnabled
    public static void deleteMember(Id memberId) {
        delete [SELECT Id FROM Round_Robin_Member__c WHERE Id = :memberId];
    }

    @AuraEnabled
    public static void toggleAvailability(Id memberId, Boolean isAvailable) {
        update new Round_Robin_Member__c(
            Id = memberId,
            Is_Available__c = isAvailable
        );
    }

    @AuraEnabled
    public static void updateSortOrder(List<Id> memberIds) {
        List<Round_Robin_Member__c> membersToUpdate = new List<Round_Robin_Member__c>();
        for (Integer i = 0; i < memberIds.size(); i++) {
            membersToUpdate.add(new Round_Robin_Member__c(
                Id = memberIds[i],
                Sort_Order__c = i + 1
            ));
        }
        update membersToUpdate;
    }

    @AuraEnabled(cacheable=true)
    public static List<User> searchUsers(String searchTerm) {
        String searchPattern = '%' + String.escapeSingleQuotes(searchTerm) + '%';
        return [
            SELECT Id, Name, Email, IsActive
            FROM User
            WHERE IsActive = true
                AND Name LIKE :searchPattern
            ORDER BY Name ASC
            LIMIT 20
        ];
    }

    public class RoundRobinControllerException extends Exception {}
}
