@isTest
public class RoundRobinServiceTest {

    @TestSetup
    static void setupData() {
        List<User> users = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 3];

        List<Round_Robin_Agent__c> agents = new List<Round_Robin_Agent__c>();
        for (Integer i = 0; i < users.size(); i++) {
            agents.add(new Round_Robin_Agent__c(
                User__c = users[i].Id,
                Sort_Order__c = i + 1,
                Is_Available__c = true
            ));
        }
        insert agents;
    }

    @isTest
    static void testSingleLeadAssignment() {
        Lead testLead = new Lead(LastName = 'TestLead', Company = 'TestCo');
        insert testLead;

        List<Id> leadIds = new List<Id>{ testLead.Id };

        Test.startTest();
        List<Id> assignedUserIds = RoundRobinService.assignLeads(leadIds);
        Test.stopTest();

        System.assertEquals(1, assignedUserIds.size());
        Lead updatedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(assignedUserIds[0], updatedLead.OwnerId);
    }

    @isTest
    static void testBulkLeadAssignment() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 5; i++) {
            leads.add(new Lead(LastName = 'BulkLead' + i, Company = 'BulkCo'));
        }
        insert leads;

        List<Id> leadIds = new List<Id>();
        for (Lead l : leads) {
            leadIds.add(l.Id);
        }

        Test.startTest();
        List<Id> assignedUserIds = RoundRobinService.assignLeads(leadIds);
        Test.stopTest();

        System.assertEquals(5, assignedUserIds.size());
        Set<Id> uniqueUsers = new Set<Id>(assignedUserIds);
        System.assert(uniqueUsers.size() > 1, 'Leads should be distributed across multiple agents');
    }

    @isTest
    static void testNoAvailableAgentsThrowsException() {
        List<Round_Robin_Agent__c> agents = [SELECT Id, Is_Available__c FROM Round_Robin_Agent__c];
        for (Round_Robin_Agent__c agent : agents) {
            agent.Is_Available__c = false;
        }
        update agents;

        Lead testLead = new Lead(LastName = 'NoAgentLead', Company = 'NoAgentCo');
        insert testLead;

        Test.startTest();
        try {
            RoundRobinService.assignLeads(new List<Id>{ testLead.Id });
            System.assert(false, 'Expected RoundRobinException');
        } catch (RoundRobinService.RoundRobinException e) {
            System.assert(e.getMessage().contains('No available agents'));
        }
        Test.stopTest();
    }

    @isTest
    static void testSkipsUnavailableAgents() {
        List<Round_Robin_Agent__c> agents = [SELECT Id, Sort_Order__c, Is_Available__c FROM Round_Robin_Agent__c ORDER BY Sort_Order__c];
        agents[0].Is_Available__c = false;
        update agents;

        Lead testLead = new Lead(LastName = 'SkipLead', Company = 'SkipCo');
        insert testLead;

        Test.startTest();
        List<Id> assignedUserIds = RoundRobinService.assignLeads(new List<Id>{ testLead.Id });
        Test.stopTest();

        Round_Robin_Agent__c skippedAgent = [SELECT User__c FROM Round_Robin_Agent__c WHERE Id = :agents[0].Id];
        System.assertNotEquals(skippedAgent.User__c, assignedUserIds[0]);
    }

    @isTest
    static void testEmptyLeadListReturnsEmpty() {
        Test.startTest();
        List<Id> result = RoundRobinService.assignLeads(new List<Id>());
        Test.stopTest();

        System.assertEquals(0, result.size());
    }

    @isTest
    static void testAssignmentUpdatesLastAssignedDate() {
        Lead testLead = new Lead(LastName = 'DateLead', Company = 'DateCo');
        insert testLead;

        Test.startTest();
        RoundRobinService.assignLeads(new List<Id>{ testLead.Id });
        Test.stopTest();

        List<Round_Robin_Agent__c> agents = [SELECT Last_Assigned_Date__c FROM Round_Robin_Agent__c WHERE Last_Assigned_Date__c != null];
        System.assert(!agents.isEmpty(), 'At least one agent should have Last_Assigned_Date__c set');
    }
}
