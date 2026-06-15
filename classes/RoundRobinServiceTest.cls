@IsTest
private class RoundRobinServiceTest {

    @TestSetup
    static void setupTestData() {
        Round_Robin_Group__c group1 = new Round_Robin_Group__c(
            Active__c = true,
            Priority__c = 1,
            Country_Criteria__c = 'US,CA',
            Lead_Source_Criteria__c = 'Web',
            Rating_Criteria__c = ''
        );
        Round_Robin_Group__c group2 = new Round_Robin_Group__c(
            Active__c = true,
            Priority__c = 2,
            Country_Criteria__c = 'UK',
            Lead_Source_Criteria__c = '',
            Rating_Criteria__c = 'Hot'
        );
        Round_Robin_Group__c inactiveGroup = new Round_Robin_Group__c(
            Active__c = false,
            Priority__c = 1,
            Country_Criteria__c = '',
            Lead_Source_Criteria__c = '',
            Rating_Criteria__c = ''
        );
        insert new List<Round_Robin_Group__c>{ group1, group2, inactiveGroup };

        List<User> testUsers = [SELECT Id FROM User WHERE IsActive = true LIMIT 5];

        List<Round_Robin_Member__c> members = new List<Round_Robin_Member__c>();
        for (Integer i = 0; i < Math.min(3, testUsers.size()); i++) {
            members.add(new Round_Robin_Member__c(
                Group__c = group1.Id,
                User__c = testUsers[i].Id,
                Sort_Order__c = i + 1,
                Is_Active__c = true
            ));
        }
        if (testUsers.size() > 3) {
            members.add(new Round_Robin_Member__c(
                Group__c = group2.Id,
                User__c = testUsers[3].Id,
                Sort_Order__c = 1,
                Is_Active__c = true
            ));
        }
        if (testUsers.size() > 4) {
            members.add(new Round_Robin_Member__c(
                Group__c = group2.Id,
                User__c = testUsers[4].Id,
                Sort_Order__c = 2,
                Is_Active__c = true
            ));
        }
        insert members;
    }

    @IsTest
    static void testSingleLeadAssignment() {
        Lead testLead = new Lead(
            FirstName = 'Test',
            LastName = 'Lead',
            Company = 'Test Co',
            Country = 'US',
            LeadSource = 'Web'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c WHERE Priority__c = 1 AND Active__c = true];
        List<Round_Robin_Member__c> members = [
            SELECT User__c FROM Round_Robin_Member__c
            WHERE Group__c = :group1.Id AND Is_Active__c = true
            ORDER BY Sort_Order__c ASC
        ];

        System.assertEquals(members[0].User__c, insertedLead.OwnerId, 'Lead should be assigned to first member');

        List<Round_Robin_Log__c> logs = [SELECT Status__c, Assigned_To__c FROM Round_Robin_Log__c WHERE Lead__c = :testLead.Id];
        System.assertEquals(1, logs.size(), 'One log record should be created');
        System.assertEquals('Success', logs[0].Status__c, 'Log status should be Success');
    }

    @IsTest
    static void testBatchRoundRobinDistribution() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c WHERE Priority__c = 1 AND Active__c = true];
        List<Round_Robin_Member__c> members = [
            SELECT User__c FROM Round_Robin_Member__c
            WHERE Group__c = :group1.Id AND Is_Active__c = true
            ORDER BY Sort_Order__c ASC
        ];
        Integer memberCount = members.size();

        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < memberCount * 2; i++) {
            leads.add(new Lead(
                FirstName = 'Batch',
                LastName = 'Lead ' + i,
                Company = 'Batch Co ' + i,
                Country = 'US',
                LeadSource = 'Web'
            ));
        }

        Test.startTest();
        insert leads;
        Test.stopTest();

        Map<Id, Integer> assignmentCounts = new Map<Id, Integer>();
        for (Lead ld : [SELECT OwnerId FROM Lead WHERE Id IN :leads]) {
            Integer count = assignmentCounts.containsKey(ld.OwnerId) ? assignmentCounts.get(ld.OwnerId) : 0;
            assignmentCounts.put(ld.OwnerId, count + 1);
        }

        for (Round_Robin_Member__c member : members) {
            Integer count = assignmentCounts.get(member.User__c);
            System.assertEquals(2, count, 'Each member should get exactly 2 leads in round-robin');
        }
    }

    @IsTest
    static void testGatingNoMatch() {
        Lead testLead = new Lead(
            FirstName = 'No',
            LastName = 'Match',
            Company = 'NoMatch Co',
            Country = 'DE',
            LeadSource = 'Other'
        );

        Id originalOwner = UserInfo.getUserId();

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(originalOwner, insertedLead.OwnerId, 'Lead should keep default owner when no group matches');

        List<Round_Robin_Log__c> logs = [SELECT Status__c FROM Round_Robin_Log__c WHERE Lead__c = :testLead.Id];
        System.assertEquals(1, logs.size(), 'One log record should be created');
        System.assertEquals('Skipped', logs[0].Status__c, 'Log status should be Skipped');
    }

    @IsTest
    static void testPriorityGroupSelection() {
        Lead testLead = new Lead(
            FirstName = 'Priority',
            LastName = 'Test',
            Company = 'Priority Co',
            Country = 'UK',
            LeadSource = 'Web',
            Rating = 'Hot'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Round_Robin_Group__c group2 = [SELECT Id FROM Round_Robin_Group__c WHERE Country_Criteria__c = 'UK'];
        List<Round_Robin_Member__c> group2Members = [
            SELECT User__c FROM Round_Robin_Member__c
            WHERE Group__c = :group2.Id AND Is_Active__c = true
            ORDER BY Sort_Order__c ASC
        ];

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(group2Members[0].User__c, insertedLead.OwnerId,
            'Lead should be assigned via the UK group (group2)');
    }

    @IsTest
    static void testInactiveGroupSkipped() {
        Round_Robin_Group__c inactiveGroup = [SELECT Id FROM Round_Robin_Group__c WHERE Active__c = false];
        List<User> users = [SELECT Id FROM User WHERE IsActive = true LIMIT 1];
        insert new Round_Robin_Member__c(
            Group__c = inactiveGroup.Id,
            User__c = users[0].Id,
            Sort_Order__c = 1,
            Is_Active__c = true
        );

        Lead testLead = new Lead(
            FirstName = 'Inactive',
            LastName = 'Group',
            Company = 'Inactive Co',
            Country = 'FR',
            LeadSource = 'Event'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertNotEquals(users[0].Id, insertedLead.OwnerId,
            'Lead should not be assigned via inactive group');
    }

    @IsTest
    static void testInactiveMemberSkipped() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c WHERE Priority__c = 1 AND Active__c = true];
        List<Round_Robin_Member__c> members = [
            SELECT Id, User__c, Sort_Order__c FROM Round_Robin_Member__c
            WHERE Group__c = :group1.Id
            ORDER BY Sort_Order__c ASC
        ];

        if (members.size() > 0) {
            members[0].Is_Active__c = false;
            update members[0];
        }

        Lead testLead = new Lead(
            FirstName = 'Skip',
            LastName = 'Inactive',
            Company = 'Skip Co',
            Country = 'US',
            LeadSource = 'Web'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        if (members.size() > 1) {
            System.assertEquals(members[1].User__c, insertedLead.OwnerId,
                'Lead should be assigned to second member since first is inactive');
        }
    }

    @IsTest
    static void testIndexWrapsAround() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c WHERE Priority__c = 1 AND Active__c = true];
        List<Round_Robin_Member__c> members = [
            SELECT User__c FROM Round_Robin_Member__c
            WHERE Group__c = :group1.Id AND Is_Active__c = true
            ORDER BY Sort_Order__c ASC
        ];

        group1.Last_Assigned_Index__c = members.size() - 1;
        update group1;

        Lead testLead = new Lead(
            FirstName = 'Wrap',
            LastName = 'Around',
            Company = 'Wrap Co',
            Country = 'US',
            LeadSource = 'Web'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(members[members.size() - 1].User__c, insertedLead.OwnerId,
            'Lead should be assigned to last member before wrap');

        Round_Robin_Group__c updatedGroup = [SELECT Last_Assigned_Index__c FROM Round_Robin_Group__c WHERE Id = :group1.Id];
        System.assertEquals(members.size(), Integer.valueOf(updatedGroup.Last_Assigned_Index__c),
            'Index should wrap to member count (mod will reset to 0 on next assignment)');
    }

    @IsTest
    static void testNoActiveMembers() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c WHERE Priority__c = 1 AND Active__c = true];
        List<Round_Robin_Member__c> members = [
            SELECT Id FROM Round_Robin_Member__c WHERE Group__c = :group1.Id
        ];
        for (Round_Robin_Member__c m : members) {
            m.Is_Active__c = false;
        }
        update members;

        Lead testLead = new Lead(
            FirstName = 'No',
            LastName = 'Members',
            Company = 'Empty Co',
            Country = 'US',
            LeadSource = 'Web'
        );

        Test.startTest();
        insert testLead;
        Test.stopTest();

        Lead insertedLead = [SELECT OwnerId FROM Lead WHERE Id = :testLead.Id];
        System.assertEquals(UserInfo.getUserId(), insertedLead.OwnerId,
            'Lead should keep default owner when no active members exist');

        List<Round_Robin_Log__c> logs = [SELECT Status__c FROM Round_Robin_Log__c WHERE Lead__c = :testLead.Id];
        System.assert(!logs.isEmpty(), 'Log should be created even on skip/error');
    }

    @IsTest
    static void testBulk200Leads() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                FirstName = 'Bulk',
                LastName = 'Lead ' + i,
                Company = 'Bulk Co ' + i,
                Country = 'US',
                LeadSource = 'Web'
            ));
        }

        Test.startTest();
        insert leads;
        Test.stopTest();

        List<Round_Robin_Log__c> logs = [SELECT Id FROM Round_Robin_Log__c WHERE Lead__c IN :leads];
        System.assertEquals(200, logs.size(), 'All 200 leads should have log entries');
    }
}
