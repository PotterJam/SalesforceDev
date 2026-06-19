public with sharing class RoundRobinService {

    public static List<Id> assignLeads(List<Id> leadIds) {
        if (leadIds == null || leadIds.isEmpty()) {
            return new List<Id>();
        }

        List<Round_Robin_Agent__c> availableAgents = [
            SELECT Id, User__c, Sort_Order__c, Last_Assigned_Date__c
            FROM Round_Robin_Agent__c
            WHERE Is_Available__c = true
                AND User__c != null
            ORDER BY Sort_Order__c ASC
            FOR UPDATE
        ];

        if (availableAgents.isEmpty()) {
            throw new RoundRobinException('No available agents in the round-robin pool.');
        }

        Integer agentIndex = getNextAgentIndex(availableAgents);
        List<Lead> leadsToUpdate = new List<Lead>();
        List<Id> assignedUserIds = new List<Id>();
        Set<Id> agentsToUpdateSet = new Set<Id>();

        for (Id leadId : leadIds) {
            Round_Robin_Agent__c agent = availableAgents[agentIndex];
            leadsToUpdate.add(new Lead(Id = leadId, OwnerId = agent.User__c));
            assignedUserIds.add(agent.User__c);
            agent.Last_Assigned_Date__c = DateTime.now();
            agentsToUpdateSet.add(agent.Id);
            agentIndex = Math.mod(agentIndex + 1, availableAgents.size());
        }

        List<Round_Robin_Agent__c> agentsToUpdate = new List<Round_Robin_Agent__c>();
        for (Round_Robin_Agent__c agent : availableAgents) {
            if (agentsToUpdateSet.contains(agent.Id)) {
                agentsToUpdate.add(agent);
            }
        }

        update agentsToUpdate;
        update leadsToUpdate;

        return assignedUserIds;
    }

    private static Integer getNextAgentIndex(List<Round_Robin_Agent__c> agents) {
        Integer nextIndex = 0;
        DateTime oldestDate = null;

        for (Integer i = 0; i < agents.size(); i++) {
            DateTime lastAssigned = agents[i].Last_Assigned_Date__c;
            if (lastAssigned == null) {
                return i;
            }
            if (oldestDate == null || lastAssigned < oldestDate) {
                oldestDate = lastAssigned;
                nextIndex = i;
            }
        }

        return nextIndex;
    }

    public class RoundRobinException extends Exception {}
}
