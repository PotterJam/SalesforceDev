@IsTest
private class LeadRoundRobinTest {

    @TestSetup
    static void setupTestData() {
        Round_Robin_Group__c grp = new Round_Robin_Group__c(
            Active__c = true,
            Last_Assigned_Index__c = 0,
            Total_Assignments__c = 0
        );
        insert grp;

        List<Group> queues = new List<Group>();
        for (Integer i = 1; i <= 3; i++) {
            queues.add(new Group(
                Name = 'Test Queue ' + i,
                Type = 'Queue'
            ));
        }
        insert queues;

        List<QueueSobject> queueSobjects = new List<QueueSobject>();
        for (Group q : queues) {
            queueSobjects.add(new QueueSobject(
                QueueId = q.Id,
                SobjectType = 'Lead'
            ));
        }
        insert queueSobjects;

        List<Round_Robin_Member__c> members = new List<Round_Robin_Member__c>();
        for (Integer i = 0; i < queues.size(); i++) {
            members.add(new Round_Robin_Member__c(
                Round_Robin_Group__c = grp.Id,
                Queue_Id__c = queues[i].Id,
                Queue_Name__c = queues[i].Name,
                Active__c = true,
                Sort_Order__c = i + 1,
                Assignment_Count__c = 0,
                Current_Load__c = 0,
                Max_Capacity__c = 0
            ));
        }
        insert members;
    }

    @IsTest
    static void testSingleLeadAssignment() {
        Test.startTest();
        Lead newLead = new Lead(
            LastName = 'Test',
            Company = 'Test Corp'
        );
        insert newLead;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :newLead.Id];
        List<Round_Robin_Member__c> members = [
            SELECT Queue_Id__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c
        ];
        System.assertEquals(members[0].Queue_Id__c, inserted.OwnerId,
            'First lead should be assigned to first member queue');
    }

    @IsTest
    static void testBulkLeadDistribution() {
        List<Round_Robin_Member__c> members = [
            SELECT Queue_Id__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c
        ];

        Test.startTest();
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 6; i++) {
            leads.add(new Lead(
                LastName = 'Bulk ' + i,
                Company = 'Bulk Corp ' + i
            ));
        }
        insert leads;
        Test.stopTest();

        List<Lead> insertedLeads = [SELECT OwnerId FROM Lead WHERE Id IN :leads ORDER BY LastName];

        for (Integer i = 0; i < 6; i++) {
            Integer memberIndex = Math.mod(i, members.size());
            System.assertEquals(members[memberIndex].Queue_Id__c, insertedLeads[i].OwnerId,
                'Lead ' + i + ' should be assigned to member at index ' + memberIndex);
        }
    }

    @IsTest
    static void testSkipsInactiveMembers() {
        List<Round_Robin_Member__c> members = [
            SELECT Id FROM Round_Robin_Member__c ORDER BY Sort_Order__c
        ];
        members[1].Active__c = false;
        update members[1];

        List<Round_Robin_Member__c> activeMembers = [
            SELECT Queue_Id__c FROM Round_Robin_Member__c
            WHERE Active__c = true ORDER BY Sort_Order__c
        ];

        Test.startTest();
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 4; i++) {
            leads.add(new Lead(
                LastName = 'Skip ' + i,
                Company = 'Skip Corp ' + i
            ));
        }
        insert leads;
        Test.stopTest();

        List<Lead> insertedLeads = [SELECT OwnerId FROM Lead WHERE Id IN :leads ORDER BY LastName];

        for (Integer i = 0; i < 4; i++) {
            Integer memberIndex = Math.mod(i, activeMembers.size());
            System.assertEquals(activeMembers[memberIndex].Queue_Id__c, insertedLeads[i].OwnerId,
                'Lead should only be assigned to active members');
        }
    }

    @IsTest
    static void testSkipsMembersAtCapacity() {
        List<Round_Robin_Member__c> members = [
            SELECT Id FROM Round_Robin_Member__c ORDER BY Sort_Order__c
        ];
        members[0].Max_Capacity__c = 1;
        members[0].Current_Load__c = 1;
        update members[0];

        List<Round_Robin_Member__c> eligibleMembers = [
            SELECT Queue_Id__c FROM Round_Robin_Member__c
            WHERE Active__c = true AND (Max_Capacity__c = 0 OR Current_Load__c < Max_Capacity__c)
            ORDER BY Sort_Order__c
        ];

        Test.startTest();
        Lead newLead = new Lead(
            LastName = 'Capacity',
            Company = 'Cap Corp'
        );
        insert newLead;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :newLead.Id];
        System.assertEquals(eligibleMembers[0].Queue_Id__c, inserted.OwnerId,
            'Lead should skip members at capacity');
    }

    @IsTest
    static void testNoEligibleMembersKeepsDefaultOwner() {
        List<Round_Robin_Member__c> members = [SELECT Id FROM Round_Robin_Member__c];
        for (Round_Robin_Member__c m : members) {
            m.Active__c = false;
        }
        update members;

        Test.startTest();
        Lead newLead = new Lead(
            LastName = 'NoAssign',
            Company = 'NoAssign Corp'
        );
        insert newLead;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :newLead.Id];
        System.assertNotEquals(null, inserted.OwnerId,
            'Lead should still have a default owner when no members are eligible');

        Round_Robin_Group__c grp = [
            SELECT Error_Message__c, Last_Error_Date__c FROM Round_Robin_Group__c LIMIT 1
        ];
        System.assertNotEquals(null, grp.Error_Message__c,
            'Error message should be populated when no eligible members');
    }

    @IsTest
    static void testInactiveGroupNoAssignment() {
        Round_Robin_Group__c grp = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];
        grp.Active__c = false;
        update grp;

        List<Round_Robin_Member__c> members = [
            SELECT Queue_Id__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c
        ];

        Test.startTest();
        Lead newLead = new Lead(
            LastName = 'Inactive',
            Company = 'Inactive Corp'
        );
        insert newLead;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :newLead.Id];
        Boolean assignedToMember = false;
        for (Round_Robin_Member__c m : members) {
            if (inserted.OwnerId == m.Queue_Id__c) {
                assignedToMember = true;
                break;
            }
        }
        System.assertEquals(false, assignedToMember,
            'Lead should not be assigned to a member queue when group is inactive');
    }

    @IsTest
    static void testPointerWrapsAround() {
        Round_Robin_Group__c grp = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];
        List<Round_Robin_Member__c> members = [
            SELECT Queue_Id__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c
        ];
        grp.Last_Assigned_Index__c = members.size() - 1;
        update grp;

        Test.startTest();
        Lead newLead = new Lead(
            LastName = 'Wrap',
            Company = 'Wrap Corp'
        );
        insert newLead;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :newLead.Id];
        System.assertEquals(members[0].Queue_Id__c, inserted.OwnerId,
            'Assignment should wrap around to the first member after reaching the end');
    }

    @IsTest
    static void testServiceGetNextAssignmentsEmptyMembers() {
        Round_Robin_Group__c grp = new Round_Robin_Group__c(
            Last_Assigned_Index__c = 0
        );

        LeadRoundRobinService.AssignmentResult result =
            LeadRoundRobinService.getNextAssignments(grp, new List<Round_Robin_Member__c>(), 5);

        System.assertEquals(0, result.queueIds.size(),
            'Should return empty assignments for empty member list');
    }

    @IsTest
    static void testServiceFilterEligibleMembers() {
        List<Round_Robin_Member__c> members = new List<Round_Robin_Member__c>();
        members.add(new Round_Robin_Member__c(
            Active__c = true, Max_Capacity__c = 0, Current_Load__c = 0
        ));
        members.add(new Round_Robin_Member__c(
            Active__c = false, Max_Capacity__c = 0, Current_Load__c = 0
        ));
        members.add(new Round_Robin_Member__c(
            Active__c = true, Max_Capacity__c = 5, Current_Load__c = 5
        ));
        members.add(new Round_Robin_Member__c(
            Active__c = true, Max_Capacity__c = 5, Current_Load__c = 3
        ));

        List<Round_Robin_Member__c> eligible =
            LeadRoundRobinService.filterEligibleMembers(members);

        System.assertEquals(2, eligible.size(),
            'Should only include active members under capacity');
    }

    @IsTest
    static void testControllerGetGroups() {
        Test.startTest();
        List<Round_Robin_Group__c> groups = LeadRoundRobinController.getGroups();
        Test.stopTest();

        System.assertEquals(1, groups.size(), 'Should return 1 group');
        System.assertEquals(true, groups[0].Active__c, 'Group should be active');
    }

    @IsTest
    static void testControllerGetMembers() {
        Round_Robin_Group__c grp = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];

        Test.startTest();
        List<Round_Robin_Member__c> members =
            LeadRoundRobinController.getMembers(grp.Id);
        Test.stopTest();

        System.assertEquals(3, members.size(), 'Should return 3 members');
    }

    @IsTest
    static void testControllerToggleGroupActive() {
        Round_Robin_Group__c grp = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];

        Test.startTest();
        LeadRoundRobinController.toggleGroupActive(grp.Id, false);
        Test.stopTest();

        grp = [SELECT Active__c FROM Round_Robin_Group__c WHERE Id = :grp.Id];
        System.assertEquals(false, grp.Active__c, 'Group should be deactivated');
    }

    @IsTest
    static void testControllerToggleMemberActive() {
        Round_Robin_Member__c member = [SELECT Id FROM Round_Robin_Member__c LIMIT 1];

        Test.startTest();
        LeadRoundRobinController.toggleMemberActive(member.Id, false);
        Test.stopTest();

        member = [SELECT Active__c FROM Round_Robin_Member__c WHERE Id = :member.Id];
        System.assertEquals(false, member.Active__c, 'Member should be deactivated');
    }

    @IsTest
    static void testControllerResetCounters() {
        Round_Robin_Group__c grp = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];
        grp.Total_Assignments__c = 50;
        grp.Last_Assigned_Index__c = 2;
        update grp;

        List<Round_Robin_Member__c> members = [SELECT Id FROM Round_Robin_Member__c];
        for (Round_Robin_Member__c m : members) {
            m.Assignment_Count__c = 10;
            m.Current_Load__c = 5;
        }
        update members;

        Test.startTest();
        LeadRoundRobinController.resetCounters(grp.Id);
        Test.stopTest();

        grp = [SELECT Total_Assignments__c, Last_Assigned_Index__c FROM Round_Robin_Group__c WHERE Id = :grp.Id];
        System.assertEquals(0, grp.Total_Assignments__c, 'Total assignments should be reset');
        System.assertEquals(0, grp.Last_Assigned_Index__c, 'Last assigned index should be reset');

        members = [SELECT Assignment_Count__c, Current_Load__c FROM Round_Robin_Member__c];
        for (Round_Robin_Member__c m : members) {
            System.assertEquals(0, m.Assignment_Count__c, 'Member assignment count should be reset');
            System.assertEquals(0, m.Current_Load__c, 'Member current load should be reset');
        }
    }
}
