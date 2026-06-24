@IsTest
private class RoundRobinInvocableTest {

    @TestSetup
    static void setupTestData() {
        Round_Robin_Group__c group1 = new Round_Robin_Group__c(
            Active__c = true,
            Priority__c = 1,
            Country_Criteria__c = 'US',
            Lead_Source_Criteria__c = '',
            Rating_Criteria__c = ''
        );
        insert group1;

        List<User> testUsers = [SELECT Id FROM User WHERE IsActive = true LIMIT 2];
        List<Round_Robin_Member__c> members = new List<Round_Robin_Member__c>();
        for (Integer i = 0; i < testUsers.size(); i++) {
            members.add(new Round_Robin_Member__c(
                Group__c = group1.Id,
                User__c = testUsers[i].Id,
                Sort_Order__c = i + 1,
                Is_Active__c = true
            ));
        }
        insert members;
    }

    @IsTest
    static void testInvocableAssignsLead() {
        Lead testLead = new Lead(
            FirstName = 'Invocable',
            LastName = 'Test',
            Company = 'Invocable Co',
            Country = 'US'
        );
        insert testLead;

        Test.startTest();
        RoundRobinInvocable.assignLeads(new List<Id>{ testLead.Id });
        Test.stopTest();

        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];
        List<Round_Robin_Member__c> members = [
            SELECT User__c FROM Round_Robin_Member__c
            WHERE Group__c = :group1.Id AND Is_Active__c = true
            ORDER BY Sort_Order__c ASC
        ];

        Lead updatedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(members[0].User__c, updatedLead.OwnerId,
            'Invocable should assign Lead to first member');

        List<Round_Robin_Log__c> logs = [SELECT Status__c FROM Round_Robin_Log__c WHERE Lead__c = :testLead.Id];
        System.assertEquals(1, logs.size(), 'Log should be created');
        System.assertEquals('Success', logs[0].Status__c);
    }

    @IsTest
    static void testInvocableWithNullInput() {
        Test.startTest();
        RoundRobinInvocable.assignLeads(null);
        Test.stopTest();

        List<Round_Robin_Log__c> logs = [SELECT Id FROM Round_Robin_Log__c];
        System.assertEquals(0, logs.size(), 'No logs should be created for null input');
    }

    @IsTest
    static void testInvocableWithEmptyList() {
        Test.startTest();
        RoundRobinInvocable.assignLeads(new List<Id>());
        Test.stopTest();

        List<Round_Robin_Log__c> logs = [SELECT Id FROM Round_Robin_Log__c];
        System.assertEquals(0, logs.size(), 'No logs should be created for empty input');
    }

    @IsTest
    static void testInvocableMultipleLeads() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 4; i++) {
            leads.add(new Lead(
                FirstName = 'Multi',
                LastName = 'Lead ' + i,
                Company = 'Multi Co ' + i,
                Country = 'US'
            ));
        }
        insert leads;

        List<Id> leadIds = new List<Id>();
        for (Lead ld : leads) {
            leadIds.add(ld.Id);
        }

        Test.startTest();
        RoundRobinInvocable.assignLeads(leadIds);
        Test.stopTest();

        List<Round_Robin_Log__c> logs = [SELECT Status__c FROM Round_Robin_Log__c WHERE Lead__c IN :leads];
        System.assertEquals(4, logs.size(), 'All leads should have log entries');

        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];
        List<Round_Robin_Member__c> members = [
            SELECT User__c FROM Round_Robin_Member__c
            WHERE Group__c = :group1.Id AND Is_Active__c = true
            ORDER BY Sort_Order__c ASC
        ];

        Map<Id, Integer> counts = new Map<Id, Integer>();
        for (Lead ld : [SELECT OwnerId FROM Lead WHERE Id IN :leads]) {
            Integer c = counts.containsKey(ld.OwnerId) ? counts.get(ld.OwnerId) : 0;
            counts.put(ld.OwnerId, c + 1);
        }

        for (Round_Robin_Member__c member : members) {
            System.assertEquals(2, counts.get(member.User__c),
                'Each member should get 2 leads with 4 leads and 2 members');
        }
    }
}
