@isTest
public class RoundRobinActionTest {

    @TestSetup
    static void setupData() {
        List<User> users = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 2];

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
    static void testSuccessfulInvocation() {
        Lead testLead = new Lead(LastName = 'ActionLead', Company = 'ActionCo');
        insert testLead;

        Test.startTest();
        List<String> results = RoundRobinAction.assignLeads(new List<Id>{ testLead.Id });
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assert(results[0].contains('Successfully assigned'));
    }

    @isTest
    static void testErrorHandlingNoAgents() {
        List<Round_Robin_Agent__c> agents = [SELECT Id FROM Round_Robin_Agent__c];
        delete agents;

        Lead testLead = new Lead(LastName = 'ErrorLead', Company = 'ErrorCo');
        insert testLead;

        Test.startTest();
        List<String> results = RoundRobinAction.assignLeads(new List<Id>{ testLead.Id });
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assert(results[0].contains('Error:'));
    }

    @isTest
    static void testEmptyInput() {
        Test.startTest();
        List<String> results = RoundRobinAction.assignLeads(new List<Id>());
        Test.stopTest();

        System.assertEquals(1, results.size());
        System.assert(results[0].contains('No Lead IDs provided'));
    }
}
