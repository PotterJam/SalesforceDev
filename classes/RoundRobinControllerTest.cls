@isTest
public class RoundRobinControllerTest {

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
    static void testGetAgents() {
        Test.startTest();
        List<Round_Robin_Agent__c> agents = RoundRobinController.getAgents();
        Test.stopTest();

        System.assertEquals(2, agents.size());
        System.assert(agents[0].Sort_Order__c <= agents[1].Sort_Order__c);
    }

    @isTest
    static void testAddAgent() {
        User testUser = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 1];

        Test.startTest();
        Round_Robin_Agent__c newAgent = RoundRobinController.addAgent(testUser.Id, 99);
        Test.stopTest();

        System.assertNotEquals(null, newAgent.Id);
        Round_Robin_Agent__c inserted = [SELECT User__c, Sort_Order__c, Is_Available__c FROM Round_Robin_Agent__c WHERE Id = :newAgent.Id];
        System.assertEquals(testUser.Id, inserted.User__c);
        System.assertEquals(99, inserted.Sort_Order__c);
        System.assertEquals(true, inserted.Is_Available__c);
    }

    @isTest
    static void testRemoveAgent() {
        Round_Robin_Agent__c agent = [SELECT Id FROM Round_Robin_Agent__c LIMIT 1];

        Test.startTest();
        RoundRobinController.removeAgent(agent.Id);
        Test.stopTest();

        List<Round_Robin_Agent__c> remaining = [SELECT Id FROM Round_Robin_Agent__c WHERE Id = :agent.Id];
        System.assertEquals(0, remaining.size());
    }

    @isTest
    static void testUpdateAvailability() {
        Round_Robin_Agent__c agent = [SELECT Id, Is_Available__c FROM Round_Robin_Agent__c LIMIT 1];

        Test.startTest();
        RoundRobinController.updateAvailability(agent.Id, false);
        Test.stopTest();

        Round_Robin_Agent__c updated = [SELECT Is_Available__c FROM Round_Robin_Agent__c WHERE Id = :agent.Id];
        System.assertEquals(false, updated.Is_Available__c);
    }

    @isTest
    static void testReorderAgents() {
        List<Round_Robin_Agent__c> agents = [SELECT Id FROM Round_Robin_Agent__c ORDER BY Sort_Order__c ASC];
        List<Id> reversedIds = new List<Id>{ agents[1].Id, agents[0].Id };

        Test.startTest();
        RoundRobinController.reorderAgents(JSON.serialize(reversedIds));
        Test.stopTest();

        Round_Robin_Agent__c first = [SELECT Sort_Order__c FROM Round_Robin_Agent__c WHERE Id = :agents[1].Id];
        Round_Robin_Agent__c second = [SELECT Sort_Order__c FROM Round_Robin_Agent__c WHERE Id = :agents[0].Id];
        System.assertEquals(1, first.Sort_Order__c);
        System.assertEquals(2, second.Sort_Order__c);
    }
}
