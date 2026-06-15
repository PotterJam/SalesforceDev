public with sharing class LeadRoundRobinService {

    public static void assignLeads(List<Lead> newLeads) {
        if (newLeads == null || newLeads.isEmpty()) {
            return;
        }

        List<Lead_Round_Robin_Config__c> configs = [
            SELECT Id, Active__c, Current_Index__c
            FROM Lead_Round_Robin_Config__c
            WHERE Active__c = true
            LIMIT 1
            FOR UPDATE
        ];

        if (configs.isEmpty()) {
            return;
        }

        Lead_Round_Robin_Config__c config = configs[0];

        List<Lead_Round_Robin_Queue__c> queues = [
            SELECT Id, Queue_Id__c, Queue_Name__c, Sort_Order__c
            FROM Lead_Round_Robin_Queue__c
            WHERE Config__c = :config.Id AND Active__c = true
            ORDER BY Sort_Order__c ASC
        ];

        if (queues.isEmpty()) {
            return;
        }

        List<Lead_Round_Robin_Criteria__c> criteria = [
            SELECT Id, Field_API_Name__c, Operator__c, Value__c
            FROM Lead_Round_Robin_Criteria__c
            WHERE Config__c = :config.Id AND Active__c = true
        ];

        List<Lead_Round_Robin_Log__c> logs = new List<Lead_Round_Robin_Log__c>();
        Integer currentIndex = config.Current_Index__c != null ? (Integer) config.Current_Index__c : 0;
        Integer queueCount = queues.size();

        for (Lead ld : newLeads) {
            if (!evaluateCriteria(ld, criteria)) {
                continue;
            }

            Integer idx = Math.mod(currentIndex, queueCount);
            Lead_Round_Robin_Queue__c targetQueue = queues[idx];

            ld.OwnerId = targetQueue.Queue_Id__c;
            currentIndex++;

            logs.add(new Lead_Round_Robin_Log__c(
                Queue_Id__c = targetQueue.Queue_Id__c,
                Queue_Name__c = targetQueue.Queue_Name__c,
                Status__c = 'Success',
                Assigned_Date__c = Datetime.now()
            ));
        }

        if (currentIndex != (Integer) config.Current_Index__c) {
            config.Current_Index__c = Math.mod(currentIndex, queueCount);
            update config;
        }

        if (!logs.isEmpty()) {
            Database.insert(logs, false);
        }
    }

    public static Boolean evaluateCriteria(Lead ld, List<Lead_Round_Robin_Criteria__c> criteria) {
        if (criteria == null || criteria.isEmpty()) {
            return true;
        }

        for (Lead_Round_Robin_Criteria__c criterion : criteria) {
            String fieldValue = getFieldValue(ld, criterion.Field_API_Name__c);
            String operator = criterion.Operator__c;
            String expectedValue = criterion.Value__c;

            if (!evaluateSingleCriterion(fieldValue, operator, expectedValue)) {
                return false;
            }
        }

        return true;
    }

    private static Boolean evaluateSingleCriterion(String fieldValue, String operator, String expectedValue) {
        switch on operator {
            when 'Equals' {
                if (expectedValue != null && expectedValue.contains(',')) {
                    for (String val : expectedValue.split(',')) {
                        if (val.trim().equalsIgnoreCase(fieldValue)) {
                            return true;
                        }
                    }
                    return false;
                }
                return expectedValue != null && expectedValue.equalsIgnoreCase(fieldValue);
            }
            when 'Not Equals' {
                if (expectedValue != null && expectedValue.contains(',')) {
                    for (String val : expectedValue.split(',')) {
                        if (val.trim().equalsIgnoreCase(fieldValue)) {
                            return false;
                        }
                    }
                    return true;
                }
                return expectedValue == null || !expectedValue.equalsIgnoreCase(fieldValue);
            }
            when 'Contains' {
                return fieldValue != null && expectedValue != null && fieldValue.containsIgnoreCase(expectedValue);
            }
            when 'Not Contains' {
                return fieldValue == null || expectedValue == null || !fieldValue.containsIgnoreCase(expectedValue);
            }
            when 'Is Blank' {
                return String.isBlank(fieldValue);
            }
            when 'Is Not Blank' {
                return String.isNotBlank(fieldValue);
            }
            when else {
                return true;
            }
        }
    }

    private static String getFieldValue(Lead ld, String fieldApiName) {
        try {
            Object val = ld.get(fieldApiName);
            return val != null ? String.valueOf(val) : null;
        } catch (Exception e) {
            return null;
        }
    }

    public static void logError(String errorMessage) {
        Lead_Round_Robin_Log__c errorLog = new Lead_Round_Robin_Log__c(
            Status__c = 'Error',
            Error_Message__c = errorMessage,
            Assigned_Date__c = Datetime.now()
        );
        Database.insert(new List<Lead_Round_Robin_Log__c>{ errorLog }, false);
    }
}
