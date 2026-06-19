@isTest
private class RoundRobinServiceTest {

    @TestSetup
    static void setupTestData() {
        Round_Robin_Config__c config = new Round_Robin_Config__c(
            Is_Active__c = true
        );
        insert config;

        List<User> testUsers = [SELECT Id FROM User WHERE IsActive = true LIMIT 3];

        List<Round_Robin_Member__c> members = new List<Round_Robin_Member__c>();
        for (Integer i = 0; i < testUsers.size(); i++) {
            members.add(new Round_Robin_Member__c(
                Round_Robin_Config__c = config.Id,
                User__c = testUsers[i].Id,
                Is_Available__c = true,
                Sort_Order__c = i + 1,
                Assignment_Count__c = 0
            ));
        }
        insert members;
    }

    @isTest
    static void assignLeads_singleLead_assignsToFirstMember() {
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];
        Round_Robin_Member__c firstMember = [
            SELECT Id, User__c FROM Round_Robin_Member__c
            WHERE Round_Robin_Config__c = :config.Id
            ORDER BY Sort_Order__c ASC LIMIT 1
        ];

        Lead testLead = new Lead(LastName = 'Test', Company = 'Test Co');
        insert testLead;

        Test.startTest();
        RoundRobinService.assignLeads([SELECT Id FROM Lead WHERE Id = :testLead.Id]);
        Test.stopTest();

        Lead updatedLead = [SELECT OwnerId, Round_Robin_Assigned__c, Round_Robin_Assigned_Date__c FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(firstMember.User__c, updatedLead.OwnerId);
        System.assertEquals(true, updatedLead.Round_Robin_Assigned__c);
        System.assertNotEquals(null, updatedLead.Round_Robin_Assigned_Date__c);
    }

    @isTest
    static void assignLeads_multipleLeads_cyclesThroughMembers() {
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];
        List<Round_Robin_Member__c> members = [
            SELECT Id, User__c FROM Round_Robin_Member__c
            WHERE Round_Robin_Config__c = :config.Id
            ORDER BY Sort_Order__c ASC
        ];

        List<Lead> testLeads = new List<Lead>();
        for (Integer i = 0; i < 5; i++) {
            testLeads.add(new Lead(LastName = 'Test' + i, Company = 'Co' + i));
        }
        insert testLeads;

        Test.startTest();
        RoundRobinService.assignLeads([SELECT Id FROM Lead WHERE Id IN :testLeads]);
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT OwnerId FROM Lead WHERE Id IN :testLeads ORDER BY LastName];
        for (Integer i = 0; i < updatedLeads.size(); i++) {
            Integer expectedMemberIndex = Math.mod(i, members.size());
            System.assertEquals(members[expectedMemberIndex].User__c, updatedLeads[i].OwnerId);
        }
    }

    @isTest
    static void assignLeads_noActiveConfig_skipsAssignment() {
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];
        config.Is_Active__c = false;
        update config;

        Lead testLead = new Lead(LastName = 'Test', Company = 'Test Co');
        insert testLead;
        Id originalOwner = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id].OwnerId;

        Test.startTest();
        RoundRobinService.assignLeads([SELECT Id FROM Lead WHERE Id = :testLead.Id]);
        Test.stopTest();

        Lead updatedLead = [SELECT OwnerId, Round_Robin_Assigned__c FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(originalOwner, updatedLead.OwnerId);
        System.assertEquals(false, updatedLead.Round_Robin_Assigned__c);
    }

    @isTest
    static void assignLeads_noAvailableMembers_assignsToFallback() {
        User fallbackUser = [SELECT Id FROM User WHERE IsActive = true LIMIT 1];
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];
        config.Fallback_Owner__c = fallbackUser.Id;
        update config;

        List<Round_Robin_Member__c> members = [SELECT Id FROM Round_Robin_Member__c WHERE Round_Robin_Config__c = :config.Id];
        for (Round_Robin_Member__c m : members) {
            m.Is_Available__c = false;
        }
        update members;

        Lead testLead = new Lead(LastName = 'Test', Company = 'Test Co');
        insert testLead;

        Test.startTest();
        RoundRobinService.assignLeads([SELECT Id FROM Lead WHERE Id = :testLead.Id]);
        Test.stopTest();

        Lead updatedLead = [SELECT OwnerId, Round_Robin_Assigned__c FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(fallbackUser.Id, updatedLead.OwnerId);
        System.assertEquals(true, updatedLead.Round_Robin_Assigned__c);
    }

    @isTest
    static void assignLeads_noAvailableMembersNoFallback_skipsAssignment() {
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];
        config.Fallback_Owner__c = null;
        update config;

        List<Round_Robin_Member__c> members = [SELECT Id FROM Round_Robin_Member__c WHERE Round_Robin_Config__c = :config.Id];
        for (Round_Robin_Member__c m : members) {
            m.Is_Available__c = false;
        }
        update members;

        Lead testLead = new Lead(LastName = 'Test', Company = 'Test Co');
        insert testLead;
        Id originalOwner = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id].OwnerId;

        Test.startTest();
        RoundRobinService.assignLeads([SELECT Id FROM Lead WHERE Id = :testLead.Id]);
        Test.stopTest();

        Lead updatedLead = [SELECT OwnerId, Round_Robin_Assigned__c FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(originalOwner, updatedLead.OwnerId);
        System.assertEquals(false, updatedLead.Round_Robin_Assigned__c);
    }

    @isTest
    static void assignLeads_updatesAssignmentCount() {
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];
        List<Round_Robin_Member__c> members = [
            SELECT Id, Assignment_Count__c FROM Round_Robin_Member__c
            WHERE Round_Robin_Config__c = :config.Id
            ORDER BY Sort_Order__c ASC
        ];

        Lead testLead = new Lead(LastName = 'Test', Company = 'Test Co');
        insert testLead;

        Test.startTest();
        RoundRobinService.assignLeads([SELECT Id FROM Lead WHERE Id = :testLead.Id]);
        Test.stopTest();

        Round_Robin_Member__c updatedMember = [
            SELECT Assignment_Count__c, Last_Assigned_Date__c
            FROM Round_Robin_Member__c WHERE Id = :members[0].Id
        ];
        System.assertEquals(1, updatedMember.Assignment_Count__c);
        System.assertNotEquals(null, updatedMember.Last_Assigned_Date__c);
    }

    @isTest
    static void assignLeads_nullInput_doesNotThrow() {
        Test.startTest();
        RoundRobinService.assignLeads(null);
        RoundRobinService.assignLeads(new List<Lead>());
        Test.stopTest();
    }
}
