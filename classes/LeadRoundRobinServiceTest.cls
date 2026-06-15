@IsTest
private class LeadRoundRobinServiceTest {

    @TestSetup
    static void setupTestData() {
        Lead_Round_Robin_Config__c config = new Lead_Round_Robin_Config__c(
            Active__c = true,
            Current_Index__c = 0,
            Description__c = 'Test Config'
        );
        insert config;

        List<Lead_Round_Robin_Queue__c> queues = new List<Lead_Round_Robin_Queue__c>();
        for (Integer i = 0; i < 3; i++) {
            queues.add(new Lead_Round_Robin_Queue__c(
                Name = 'Queue ' + i,
                Config__c = config.Id,
                Queue_Id__c = createMockQueueId(i),
                Queue_Name__c = 'Test_Queue_' + i,
                Sort_Order__c = i,
                Active__c = true
            ));
        }
        insert queues;

        List<Lead_Round_Robin_Criteria__c> criteria = new List<Lead_Round_Robin_Criteria__c>();
        criteria.add(new Lead_Round_Robin_Criteria__c(
            Name = 'LeadSource Equals Web',
            Config__c = config.Id,
            Field_API_Name__c = 'LeadSource',
            Operator__c = 'Equals',
            Value__c = 'Web',
            Active__c = true
        ));
        insert criteria;
    }

    private static String createMockQueueId(Integer idx) {
        String base = '00G000000000' + String.valueOf(idx).leftPad(6, '0');
        return base;
    }

    @IsTest
    static void testLeadQualifiesAndGetsAssigned() {
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Corp',
            LeadSource = 'Web'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(createMockQueueId(0), insertedLead.OwnerId,
            'Lead should be assigned to first queue in rotation');
    }

    @IsTest
    static void testLeadDoesNotQualify() {
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'NoMatch',
            Company = 'Test Corp',
            LeadSource = 'Phone Inquiry'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertNotEquals(createMockQueueId(0), insertedLead.OwnerId,
            'Lead should not be assigned via round robin when criteria not met');
    }

    @IsTest
    static void testBulkRotation() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 9; i++) {
            leads.add(new Lead(
                FirstName = 'Bulk',
                LastName = 'Lead' + i,
                Company = 'Corp ' + i,
                LeadSource = 'Web'
            ));
        }

        Test.startTest();
        insert leads;
        Test.stopTest();

        List<Lead> insertedLeads = [SELECT OwnerId FROM Lead WHERE Id IN :leads ORDER BY LastName];
        for (Integer i = 0; i < 9; i++) {
            Integer expectedQueueIdx = Math.mod(i, 3);
            System.assertEquals(createMockQueueId(expectedQueueIdx), insertedLeads[i].OwnerId,
                'Lead ' + i + ' should be assigned to queue ' + expectedQueueIdx);
        }

        Lead_Round_Robin_Config__c config = [SELECT Current_Index__c FROM Lead_Round_Robin_Config__c LIMIT 1];
        System.assertEquals(0, config.Current_Index__c,
            'Index should wrap back to 0 after 9 leads across 3 queues');
    }

    @IsTest
    static void testConfigInactive() {
        Lead_Round_Robin_Config__c config = [SELECT Id FROM Lead_Round_Robin_Config__c LIMIT 1];
        config.Active__c = false;
        update config;

        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Inactive',
            Company = 'Test Corp',
            LeadSource = 'Web'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertNotEquals(createMockQueueId(0), insertedLead.OwnerId,
            'Lead should not be assigned when config is inactive');
    }

    @IsTest
    static void testNoActiveQueues() {
        List<Lead_Round_Robin_Queue__c> queues = [SELECT Id FROM Lead_Round_Robin_Queue__c];
        for (Lead_Round_Robin_Queue__c q : queues) {
            q.Active__c = false;
        }
        update queues;

        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'NoQueues',
            Company = 'Test Corp',
            LeadSource = 'Web'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertNotEquals(createMockQueueId(0), insertedLead.OwnerId,
            'Lead should not be assigned when no active queues exist');
    }

    @IsTest
    static void testCriteriaEquals() {
        Lead ld = new Lead(LeadSource = 'Web');
        Lead_Round_Robin_Criteria__c criterion = new Lead_Round_Robin_Criteria__c(
            Field_API_Name__c = 'LeadSource',
            Operator__c = 'Equals',
            Value__c = 'Web'
        );
        System.assert(LeadRoundRobinService.evaluateCriteria(ld, new List<Lead_Round_Robin_Criteria__c>{ criterion }));
    }

    @IsTest
    static void testCriteriaEqualsMultiValue() {
        Lead ld = new Lead(LeadSource = 'Phone Inquiry');
        Lead_Round_Robin_Criteria__c criterion = new Lead_Round_Robin_Criteria__c(
            Field_API_Name__c = 'LeadSource',
            Operator__c = 'Equals',
            Value__c = 'Web,Phone Inquiry,Partner'
        );
        System.assert(LeadRoundRobinService.evaluateCriteria(ld, new List<Lead_Round_Robin_Criteria__c>{ criterion }));
    }

    @IsTest
    static void testCriteriaNotEquals() {
        Lead ld = new Lead(LeadSource = 'Web');
        Lead_Round_Robin_Criteria__c criterion = new Lead_Round_Robin_Criteria__c(
            Field_API_Name__c = 'LeadSource',
            Operator__c = 'Not Equals',
            Value__c = 'Phone Inquiry'
        );
        System.assert(LeadRoundRobinService.evaluateCriteria(ld, new List<Lead_Round_Robin_Criteria__c>{ criterion }));
    }

    @IsTest
    static void testCriteriaContains() {
        Lead ld = new Lead(Company = 'Acme Corporation');
        Lead_Round_Robin_Criteria__c criterion = new Lead_Round_Robin_Criteria__c(
            Field_API_Name__c = 'Company',
            Operator__c = 'Contains',
            Value__c = 'Acme'
        );
        System.assert(LeadRoundRobinService.evaluateCriteria(ld, new List<Lead_Round_Robin_Criteria__c>{ criterion }));
    }

    @IsTest
    static void testCriteriaNotContains() {
        Lead ld = new Lead(Company = 'Acme Corporation');
        Lead_Round_Robin_Criteria__c criterion = new Lead_Round_Robin_Criteria__c(
            Field_API_Name__c = 'Company',
            Operator__c = 'Not Contains',
            Value__c = 'Beta'
        );
        System.assert(LeadRoundRobinService.evaluateCriteria(ld, new List<Lead_Round_Robin_Criteria__c>{ criterion }));
    }

    @IsTest
    static void testCriteriaIsBlank() {
        Lead ld = new Lead(Company = 'Test');
        Lead_Round_Robin_Criteria__c criterion = new Lead_Round_Robin_Criteria__c(
            Field_API_Name__c = 'Email',
            Operator__c = 'Is Blank',
            Value__c = null
        );
        System.assert(LeadRoundRobinService.evaluateCriteria(ld, new List<Lead_Round_Robin_Criteria__c>{ criterion }));
    }

    @IsTest
    static void testCriteriaIsNotBlank() {
        Lead ld = new Lead(Company = 'Test', Email = 'test@example.com');
        Lead_Round_Robin_Criteria__c criterion = new Lead_Round_Robin_Criteria__c(
            Field_API_Name__c = 'Email',
            Operator__c = 'Is Not Blank',
            Value__c = null
        );
        System.assert(LeadRoundRobinService.evaluateCriteria(ld, new List<Lead_Round_Robin_Criteria__c>{ criterion }));
    }

    @IsTest
    static void testNoCriteriaAllLeadsQualify() {
        Lead ld = new Lead(Company = 'Test');
        System.assert(LeadRoundRobinService.evaluateCriteria(ld, new List<Lead_Round_Robin_Criteria__c>()));
    }

    @IsTest
    static void testErrorLogging() {
        LeadRoundRobinService.logError('Test error message');

        List<Lead_Round_Robin_Log__c> logs = [
            SELECT Status__c, Error_Message__c
            FROM Lead_Round_Robin_Log__c
            WHERE Status__c = 'Error'
        ];
        System.assertEquals(1, logs.size());
        System.assertEquals('Test error message', logs[0].Error_Message__c);
    }

    @IsTest
    static void testSuccessLogging() {
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Logging',
            Company = 'Test Corp',
            LeadSource = 'Web'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        List<Lead_Round_Robin_Log__c> logs = [
            SELECT Status__c, Queue_Name__c
            FROM Lead_Round_Robin_Log__c
            WHERE Status__c = 'Success'
        ];
        System.assert(!logs.isEmpty(), 'Success log should be created');
        System.assertEquals('Test_Queue_0', logs[0].Queue_Name__c);
    }

    @IsTest
    static void testControllerGetConfig() {
        Test.startTest();
        Lead_Round_Robin_Config__c config = LeadRoundRobinController.getConfig();
        Test.stopTest();

        System.assertNotEquals(null, config);
        System.assertEquals(true, config.Active__c);
    }

    @IsTest
    static void testControllerSaveConfig() {
        Lead_Round_Robin_Config__c config = LeadRoundRobinController.getConfig();
        config.Description__c = 'Updated';

        Test.startTest();
        Lead_Round_Robin_Config__c result = LeadRoundRobinController.saveConfig(config);
        Test.stopTest();

        System.assertEquals('Updated', result.Description__c);
    }

    @IsTest
    static void testControllerSaveAndDeleteQueues() {
        Lead_Round_Robin_Config__c config = LeadRoundRobinController.getConfig();
        Lead_Round_Robin_Queue__c newQueue = new Lead_Round_Robin_Queue__c(
            Name = 'New Queue',
            Config__c = config.Id,
            Queue_Id__c = '00G000000099999',
            Queue_Name__c = 'New_Test_Queue',
            Sort_Order__c = 10,
            Active__c = true
        );

        Test.startTest();
        List<Lead_Round_Robin_Queue__c> saved = LeadRoundRobinController.saveQueues(
            new List<Lead_Round_Robin_Queue__c>{ newQueue }
        );
        System.assertEquals(1, saved.size());

        LeadRoundRobinController.deleteQueues(new List<Id>{ saved[0].Id });
        Test.stopTest();

        List<Lead_Round_Robin_Queue__c> remaining = [
            SELECT Id FROM Lead_Round_Robin_Queue__c WHERE Id = :saved[0].Id
        ];
        System.assertEquals(0, remaining.size());
    }

    @IsTest
    static void testControllerSaveAndDeleteCriteria() {
        Lead_Round_Robin_Config__c config = LeadRoundRobinController.getConfig();
        Lead_Round_Robin_Criteria__c newCriterion = new Lead_Round_Robin_Criteria__c(
            Name = 'Test Criterion',
            Config__c = config.Id,
            Field_API_Name__c = 'Industry',
            Operator__c = 'Equals',
            Value__c = 'Technology',
            Active__c = true
        );

        Test.startTest();
        List<Lead_Round_Robin_Criteria__c> saved = LeadRoundRobinController.saveCriteria(
            new List<Lead_Round_Robin_Criteria__c>{ newCriterion }
        );
        System.assertEquals(1, saved.size());

        LeadRoundRobinController.deleteCriteria(new List<Id>{ saved[0].Id });
        Test.stopTest();

        List<Lead_Round_Robin_Criteria__c> remaining = [
            SELECT Id FROM Lead_Round_Robin_Criteria__c WHERE Id = :saved[0].Id
        ];
        System.assertEquals(0, remaining.size());
    }

    @IsTest
    static void testControllerGetAssignmentLogs() {
        LeadRoundRobinService.logError('Test log entry');

        Test.startTest();
        List<Lead_Round_Robin_Log__c> logs = LeadRoundRobinController.getAssignmentLogs(10);
        Test.stopTest();

        System.assert(!logs.isEmpty());
    }

    @IsTest
    static void testControllerGetAvailableQueues() {
        Test.startTest();
        List<LeadRoundRobinController.QueueInfo> queues = LeadRoundRobinController.getAvailableQueues();
        Test.stopTest();

        System.assertNotEquals(null, queues);
    }
}
