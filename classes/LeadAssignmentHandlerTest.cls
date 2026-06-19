@isTest
private class LeadAssignmentHandlerTest {

    @TestSetup
    static void setupTestData() {
        Round_Robin_Config__c config = new Round_Robin_Config__c(
            Is_Active__c = true
        );
        insert config;

        User testUser = [SELECT Id FROM User WHERE IsActive = true LIMIT 1];
        insert new Round_Robin_Member__c(
            Round_Robin_Config__c = config.Id,
            User__c = testUser.Id,
            Is_Available__c = true,
            Sort_Order__c = 1,
            Assignment_Count__c = 0
        );
    }

    @isTest
    static void handleAfterInsert_triggersRoundRobinAssignment() {
        Round_Robin_Member__c member = [SELECT User__c FROM Round_Robin_Member__c LIMIT 1];

        Test.startTest();
        Lead testLead = new Lead(LastName = 'TriggerTest', Company = 'Trigger Co');
        insert testLead;
        Test.stopTest();

        Lead updatedLead = [SELECT OwnerId, Round_Robin_Assigned__c FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(member.User__c, updatedLead.OwnerId);
        System.assertEquals(true, updatedLead.Round_Robin_Assigned__c);
    }

    @isTest
    static void handleAfterInsert_bulkLeads_assignsAll() {
        Test.startTest();
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(LastName = 'Bulk' + i, Company = 'Co' + i));
        }
        insert leads;
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Round_Robin_Assigned__c FROM Lead WHERE Id IN :leads];
        for (Lead ld : updatedLeads) {
            System.assertEquals(true, ld.Round_Robin_Assigned__c);
        }
    }

    @isTest
    static void handleAfterInsert_noConfig_doesNotBlockInsert() {
        delete [SELECT Id FROM Round_Robin_Config__c];

        Test.startTest();
        Lead testLead = new Lead(LastName = 'NoConfig', Company = 'NoConfig Co');
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT Id, Round_Robin_Assigned__c FROM Lead WHERE Id = :testLead.Id];
        System.assertNotEquals(null, insertedLead.Id);
        System.assertEquals(false, insertedLead.Round_Robin_Assigned__c);
    }
}
