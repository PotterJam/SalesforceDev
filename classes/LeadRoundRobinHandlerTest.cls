@IsTest
public class LeadRoundRobinHandlerTest {

    @TestSetup
    static void setupTestData() {
        Lead_Assignment_Pool__c pool = new Lead_Assignment_Pool__c(
            Pool_Name__c = 'Handler Test Pool',
            Is_Active__c = true,
            Last_Assigned_Index__c = 0
        );
        insert pool;

        List<User> testUsers = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 2];

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
    static void testHandlerSuccessfulAssignment() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        Lead testLead = new Lead(LastName = 'HandlerTest', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        LeadRoundRobinHandler handler = new LeadRoundRobinHandler();
        LeadRoundRobinHandler.HandlerResult result =
            handler.handleSingleAssignment(testLead.Id, pool.Id);
        Test.stopTest();

        System.assertEquals(true, result.success);
        System.assertEquals('Success', result.status);
        System.assertNotEquals(null, result.assignedUserId);
    }

    @IsTest
    static void testHandlerCreatesLogOnSuccess() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        Lead testLead = new Lead(LastName = 'LogTest', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        LeadRoundRobinHandler handler = new LeadRoundRobinHandler();
        handler.handleSingleAssignment(testLead.Id, pool.Id);
        Test.stopTest();

        List<Lead_Assignment_Log__c> logs = [
            SELECT Status__c, Lead__c, Assigned_To__c
            FROM Lead_Assignment_Log__c
            WHERE Assignment_Pool__c = :pool.Id
        ];
        System.assertEquals(1, logs.size());
        System.assertEquals('Success', logs[0].Status__c);
        System.assertEquals(testLead.Id, logs[0].Lead__c);
        System.assertNotEquals(null, logs[0].Assigned_To__c);
    }

    @IsTest
    static void testHandlerInactivePoolCreatesErrorLog() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        pool.Is_Active__c = false;
        update pool;

        Lead testLead = new Lead(LastName = 'InactiveHandler', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        LeadRoundRobinHandler handler = new LeadRoundRobinHandler();
        LeadRoundRobinHandler.HandlerResult result =
            handler.handleSingleAssignment(testLead.Id, pool.Id);
        Test.stopTest();

        System.assertEquals(false, result.success);
        System.assertEquals('Error', result.status);
        System.assert(result.message.contains('inactive'));

        List<Lead_Assignment_Log__c> logs = [
            SELECT Status__c, Error_Message__c
            FROM Lead_Assignment_Log__c
            WHERE Assignment_Pool__c = :pool.Id
        ];
        System.assertEquals(1, logs.size());
        System.assertEquals('Error', logs[0].Status__c);
    }

    @IsTest
    static void testHandlerBulkAssignment() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];

        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 5; i++) {
            leads.add(new Lead(LastName = 'BulkHandler' + i, Company = 'BulkCo'));
        }
        insert leads;

        List<Id> leadIds = new List<Id>();
        for (Lead l : leads) {
            leadIds.add(l.Id);
        }

        Test.startTest();
        LeadRoundRobinHandler handler = new LeadRoundRobinHandler();
        List<LeadRoundRobinHandler.HandlerResult> results =
            handler.handleAssignment(leadIds, pool.Id);
        Test.stopTest();

        System.assertEquals(5, results.size());
        for (LeadRoundRobinHandler.HandlerResult r : results) {
            System.assertEquals(true, r.success);
        }
    }

    @IsTest
    static void testInvocableAction() {
        Lead_Assignment_Pool__c pool = [SELECT Id FROM Lead_Assignment_Pool__c LIMIT 1];
        Lead testLead = new Lead(LastName = 'InvocableTest', Company = 'TestCo');
        insert testLead;

        LeadAssignmentAction.AssignmentRequest req = new LeadAssignmentAction.AssignmentRequest();
        req.leadId = testLead.Id;
        req.poolId = pool.Id;

        Test.startTest();
        List<LeadAssignmentAction.AssignmentResponse> responses =
            LeadAssignmentAction.assignLeads(new List<LeadAssignmentAction.AssignmentRequest>{ req });
        Test.stopTest();

        System.assertEquals(1, responses.size());
        System.assertEquals(true, responses[0].isSuccess);
        System.assertNotEquals(null, responses[0].assignedUserId);
    }

    @IsTest
    static void testFallbackAssignmentMarkedAsSuccess() {
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

        Lead testLead = new Lead(LastName = 'FallbackHandler', Company = 'TestCo');
        insert testLead;

        Test.startTest();
        LeadRoundRobinHandler handler = new LeadRoundRobinHandler();
        LeadRoundRobinHandler.HandlerResult result =
            handler.handleSingleAssignment(testLead.Id, pool.Id);
        Test.stopTest();

        System.assertEquals(true, result.success);
        System.assertEquals('Fallback', result.status);
        System.assertEquals(fallbackUser.Id, result.assignedUserId);
    }
}
