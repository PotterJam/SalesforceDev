public with sharing class RoundRobinAdminController {

    private static final String LOG_PREFIX = 'RoundRobinAdminController';
    private static final Integer MAX_RETRIES = 3;
    private static final Integer BATCH_SIZE = 200;

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Group__c> getGroups() {
        return [
            SELECT Id, Name, Active__c, Priority__c, Description__c,
                   Last_Assigned_Index__c, Lead_Source_Criteria__c,
                   Country_Criteria__c, Rating_Criteria__c,
                   (SELECT Id, User__c, User__r.Name, Sort_Order__c, Is_Active__c
                    FROM Members__r
                    ORDER BY Sort_Order__c ASC)
            FROM Round_Robin_Group__c
            ORDER BY Priority__c ASC, Name ASC
        ];
    }

    @AuraEnabled
    public static Round_Robin_Group__c saveGroup(Round_Robin_Group__c grp) {
        try {
            upsert grp;
            return grp;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void deleteGroup(Id groupId) {
        try {
            delete [SELECT Id FROM Round_Robin_Group__c WHERE Id = :groupId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Member__c> getMembers(Id groupId) {
        return [
            SELECT Id, Name, Group__c, User__c, User__r.Name, Sort_Order__c, Is_Active__c
            FROM Round_Robin_Member__c
            WHERE Group__c = :groupId
            ORDER BY Sort_Order__c ASC
        ];
    }

    @AuraEnabled
    public static List<Round_Robin_Member__c> saveMembers(List<Round_Robin_Member__c> members) {
        try {
            upsert members;
            return members;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void deleteMember(Id memberId) {
        try {
            delete [SELECT Id FROM Round_Robin_Member__c WHERE Id = :memberId];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Log__c> getLogs(Id groupId, Integer limitCount) {
        Integer queryLimit = (limitCount != null && limitCount > 0) ? limitCount : 50;
        return [
            SELECT Id, Name, Group__c, Group__r.Name, Lead__c, Lead__r.Name,
                   Assigned_To__c, Assigned_To__r.Name, Status__c,
                   Error_Message__c, Assignment_Date__c
            FROM Round_Robin_Log__c
            WHERE Group__c = :groupId
            ORDER BY Assignment_Date__c DESC
            LIMIT :queryLimit
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<User> searchUsers(String searchTerm) {
        if (String.isBlank(searchTerm) || searchTerm.length() < 2) {
            return new List<User>();
        }
        String searchPattern = '%' + String.escapeSingleQuotes(searchTerm) + '%';
        return [
            SELECT Id, Name, Email, IsActive
            FROM User
            WHERE IsActive = true
            AND (Name LIKE :searchPattern OR Email LIKE :searchPattern)
            ORDER BY Name ASC
            LIMIT 20
        ];
    }

    public class RoundRobinAdminControllerException extends Exception {}
}
