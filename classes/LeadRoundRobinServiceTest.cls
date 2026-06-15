@IsTest
public class LeadRoundRobinServiceTest {

    @TestSetup
    static void setupTestData() {
        Lead_Assignment_Pool__c pool = new Lead_Assignment_Pool__c(
            Pool_Name__c = 'Test Pool',
            Is_Active__c = true,
            Last_Assigned_Index__c = 0
        );
        insert pool;

        List<User> testUsers = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 3];

        List<Lead_Assignment_Member__c> members = new List<Lead_Assignment_Member__c>();
        for (Integer i = 0; i < testUsers.size(); i++) {
            members.add(new Lead_Assignment_Member__c(
                Assignment_Pool__c = pool.Id,
                User__c = testUsers[i].Id,
                Sort_Order__c = i + 1,
                Is_Available__c = true,
                Max_Open_Leads__c = 50
            ));
        }
        insert members;
    }

    @IsTest
    static void testAssignSingleLead() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        Lead testLead = new Lead(LastName = 'TestLead', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        LeadRoundRobinService service = new LeadRoundRobinService();
        LeadRoundRobinService.AssignmentResult result = service.assignLead(testLead.Id, pool.Id);
        Test.stopTest();

        System.assertEquals('Success', result.status);
        System.assertNotEquals(null, result.assignedUserId);

        Lead updatedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(result.assignedUserId, updatedLead.OwnerId);
    }

    @IsTest
    static void testRoundRobinAdvancesPointer() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 3; i++) {
            leads.add(new Lead(LastName = 'TestLead' + i, Company = 'TestCo'));
        }
        insert leads;

        List<Id> leadIds = new List<Id>();
        for (Lead l : leads) {
            leadIds.add(l.Id);
        }

        Test.startTest();
        LeadRoundRobinService service = new LeadRoundRobinService();
        List<LeadRoundRobinService.AssignmentResult> results = service.assignLeads(leadIds, pool.Id);
        Test.stopTest();

        Set<Id> assignedUsers = new Set<Id>();
        for (LeadRoundRobinService.AssignmentResult r : results) {
            System.assertEquals('Success', r.status);
            assignedUsers.add(r.assignedUserId);
        }
        System.assertEquals(3, assignedUsers.size());
    }

    @IsTest
    static void testCapacityGating() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        List<Lead_Assignment_Member__c> members = [
            SELECT Id, User__c FROM Lead_Assignment_Member__c
            WHERE Assignment_Pool__c = :pool.Id
            ORDER BY Sort_Order__c ASC
        ];

        members[0].Max_Open_Leads__c = 0;
        update members[0];

        Lead testLead = new Lead(LastName = 'CapTest', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        LeadRoundRobinService service = new LeadRoundRobinService();
        LeadRoundRobinService.AssignmentResult result = service.assignLead(testLead.Id, pool.Id);
        Test.stopTest();

        System.assertEquals('Success', result.status);
        System.assertNotEquals(members[0].User__c, result.assignedUserId);
    }

    @IsTest
    static void testAllMembersUnavailableWithFallback() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        User fallbackUser = [SELECT Id FROM User WHERE IsActive = true LIMIT 1];

        pool.Fallback_Owner__c = fallbackUser.Id;
        update pool;

        List<Lead_Assignment_Member__c> members = [
            SELECT Id FROM Lead_Assignment_Member__c WHERE Assignment_Pool__c = :pool.Id
        ];
        for (Lead_Assignment_Member__c m : members) {
            m.Is_Available__c = false;
        }
        update members;

        Lead testLead = new Lead(LastName = 'FallbackTest', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        LeadRoundRobinService service = new LeadRoundRobinService();
        LeadRoundRobinService.AssignmentResult result = service.assignLead(testLead.Id, pool.Id);
        Test.stopTest();

        System.assertEquals('Fallback', result.status);
        System.assertEquals(fallbackUser.Id, result.assignedUserId);
    }

    @IsTest
    static void testNoMembersNoFallbackReturnsError() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];

        List<Lead_Assignment_Member__c> members = [
            SELECT Id FROM Lead_Assignment_Member__c WHERE Assignment_Pool__c = :pool.Id
        ];
        for (Lead_Assignment_Member__c m : members) {
            m.Is_Available__c = false;
        }
        update members;

        Lead testLead = new Lead(LastName = 'ErrorTest', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        LeadRoundRobinService service = new LeadRoundRobinService();
        LeadRoundRobinService.AssignmentResult result = service.assignLead(testLead.Id, pool.Id);
        Test.stopTest();

        System.assertEquals('Error', result.status);
        System.assertEquals(null, result.assignedUserId);
    }

    @IsTest
    static void testInactivePoolThrowsException() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        pool.Is_Active__c = false;
        update pool;

        Lead testLead = new Lead(LastName = 'InactiveTest', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        try {
            LeadRoundRobinService service = new LeadRoundRobinService();
            service.assignLead(testLead.Id, pool.Id);
            System.assert(false, 'Expected exception was not thrown');
        } catch (LeadRoundRobinService.LeadRoundRobinServiceException e) {
            System.assert(e.getMessage().contains('inactive'));
        }
        Test.stopTest();
    }

    @IsTest
    static void testInvalidPoolIdThrowsException() {
        Lead testLead = new Lead(LastName = 'InvalidPool', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        try {
            LeadRoundRobinService service = new LeadRoundRobinService();
            service.assignLead(testLead.Id, '001000000000000AAA');
            System.assert(false, 'Expected exception was not thrown');
        } catch (LeadRoundRobinService.LeadRoundRobinServiceException e) {
            System.assert(e.getMessage().contains('not found'));
        }
        Test.stopTest();
    }

    @IsTest
    static void testBulkAssignment() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];

        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 10; i++) {
            leads.add(new Lead(LastName = 'BulkLead' + i, Company = 'BulkCo'));
        }
        insert leads;

        List<Id> leadIds = new List<Id>();
        for (Lead l : leads) {
            leadIds.add(l.Id);
        }

        Test.startTest();
        LeadRoundRobinService service = new LeadRoundRobinService();
        List<LeadRoundRobinService.AssignmentResult> results = service.assignLeads(leadIds, pool.Id);
        Test.stopTest();

        System.assertEquals(10, results.size());
        for (LeadRoundRobinService.AssignmentResult r : results) {
            System.assertEquals('Success', r.status);
        }

        List<Lead_Assignment_Log__c> logs = [
            SELECT Id FROM Lead_Assignment_Log__c WHERE Assignment_Pool__c = :pool.Id
        ];
        System.assertEquals(10, logs.size());
    }
}
