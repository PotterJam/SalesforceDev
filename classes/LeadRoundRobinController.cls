public with sharing class LeadRoundRobinController {

    @AuraEnabled(cacheable=true)
    public static Lead_Round_Robin_Config__c getConfig() {
        List<Lead_Round_Robin_Config__c> configs = [
            SELECT Id, Name, Active__c, Current_Index__c, Description__c,
                (SELECT Id, Name, Queue_Id__c, Queue_Name__c, Sort_Order__c, Active__c
                 FROM Round_Robin_Queues__r
                 ORDER BY Sort_Order__c ASC),
                (SELECT Id, Name, Field_API_Name__c, Operator__c, Value__c, Active__c
                 FROM Round_Robin_Criteria__r)
            FROM Lead_Round_Robin_Config__c
            ORDER BY CreatedDate DESC
            LIMIT 1
        ];
        return configs.isEmpty() ? null : configs[0];
    }

    @AuraEnabled
    public static Lead_Round_Robin_Config__c saveConfig(Lead_Round_Robin_Config__c config) {
        upsert config;
        return config;
    }

    @AuraEnabled
    public static List<Lead_Round_Robin_Queue__c> saveQueues(List<Lead_Round_Robin_Queue__c> queues) {
        upsert queues;
        return queues;
    }

    @AuraEnabled
    public static List<Lead_Round_Robin_Criteria__c> saveCriteria(List<Lead_Round_Robin_Criteria__c> criteria) {
        upsert criteria;
        return criteria;
    }

    @AuraEnabled
    public static void deleteQueues(List<Id> queueIds) {
        delete [SELECT Id FROM Lead_Round_Robin_Queue__c WHERE Id IN :queueIds];
    }

    @AuraEnabled
    public static void deleteCriteria(List<Id> criteriaIds) {
        delete [SELECT Id FROM Lead_Round_Robin_Criteria__c WHERE Id IN :criteriaIds];
    }

    @AuraEnabled(cacheable=true)
    public static List<Lead_Round_Robin_Log__c> getAssignmentLogs(Integer recordLimit) {
        Integer queryLimit = (recordLimit != null && recordLimit > 0) ? recordLimit : 50;
        return [
            SELECT Id, Name, Lead__c, Lead__r.Name, Queue_Id__c, Queue_Name__c,
                   Status__c, Error_Message__c, Assigned_Date__c
            FROM Lead_Round_Robin_Log__c
            ORDER BY Assigned_Date__c DESC
            LIMIT :queryLimit
        ];
    }

    @AuraEnabled(cacheable=true)
    public static List<QueueInfo> getAvailableQueues() {
        List<QueueInfo> result = new List<QueueInfo>();
        List<QueueSobject> queueSobjects = [
            SELECT QueueId, Queue.Name
            FROM QueueSobject
            WHERE SobjectType = 'Lead'
        ];
        for (QueueSobject qs : queueSobjects) {
            result.add(new QueueInfo(qs.QueueId, qs.Queue.Name));
        }
        return result;
    }

    public class QueueInfo {
        @AuraEnabled public String queueId;
        @AuraEnabled public String queueName;

        public QueueInfo(Id queueId, String queueName) {
            this.queueId = queueId;
            this.queueName = queueName;
        }
    }
}
