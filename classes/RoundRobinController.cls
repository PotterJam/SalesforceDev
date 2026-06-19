public with sharing class RoundRobinController {

    @AuraEnabled(cacheable=true)
    public static List<Round_Robin_Agent__c> getAgents() {
        try {
            return [
                SELECT Id, Name, User__c, User__r.Name, Sort_Order__c,
                       Is_Available__c, Last_Assigned_Date__c
                FROM Round_Robin_Agent__c
                ORDER BY Sort_Order__c ASC
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Round_Robin_Agent__c addAgent(Id userId, Integer sortOrder) {
        try {
            Round_Robin_Agent__c agent = new Round_Robin_Agent__c(
                User__c = userId,
                Sort_Order__c = sortOrder,
                Is_Available__c = true
            );
            insert agent;
            return agent;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void removeAgent(Id agentId) {
        try {
            Round_Robin_Agent__c agent = [
                SELECT Id FROM Round_Robin_Agent__c WHERE Id = :agentId LIMIT 1
            ];
            delete agent;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateAvailability(Id agentId, Boolean isAvailable) {
        try {
            Round_Robin_Agent__c agent = [
                SELECT Id, Is_Available__c FROM Round_Robin_Agent__c WHERE Id = :agentId LIMIT 1
            ];
            agent.Is_Available__c = isAvailable;
            update agent;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static void reorderAgents(String agentIdsJson) {
        try {
            List<Id> agentIds = (List<Id>) JSON.deserialize(agentIdsJson, List<Id>.class);
            List<Round_Robin_Agent__c> agentsToUpdate = new List<Round_Robin_Agent__c>();

            for (Integer i = 0; i < agentIds.size(); i++) {
                agentsToUpdate.add(new Round_Robin_Agent__c(
                    Id = agentIds[i],
                    Sort_Order__c = i + 1
                ));
            }

            update agentsToUpdate;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
