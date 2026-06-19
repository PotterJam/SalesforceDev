@IsTest
private class RoundRobinServiceTest {

    @TestSetup
    static void setupData() {
        Round_Robin_Queue__c queue = new Round_Robin_Queue__c(
            Active__c = true,
            Description__c = 'Test Queue',
            Last_Assigned_Index__c = 0
        );
        insert queue;

        List<User> users = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 5];

        List<Round_Robin_Member__c> members = new List<Round_Robin_Member__c>();
        for (Integer i = 0; i < users.size(); i++) {
            members.add(new Round_Robin_Member__c(
                Round_Robin_Queue__c = queue.Id,
                User__c = users[i].Id,
                Sort_Order__c = i + 1,
                Is_Available__c = true,
                Assignment_Count__c = 0
            ));
        }
        insert members;
    }

    @IsTest
    static void testSingleLeadAssignment() {
        List<Round_Robin_Member__c> members = [
            SELECT User__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC
        ];

        Test.startTest();
        Lead ld = new Lead(LastName = 'Test', Company = 'Test Co', Status = 'Open - Not Contacted');
        insert ld;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :ld.Id];
        System.assertEquals(members[0].User__c, inserted.OwnerId, 'Lead should be assigned to first member');
    }

    @IsTest
    static void testBulkAssignment() {
        List<Round_Robin_Member__c> members = [
            SELECT Id, User__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC
        ];
        Integer memberCount = members.size();

        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                LastName = 'Bulk' + i,
                Company = 'Bulk Co ' + i,
                Status = 'Open - Not Contacted'
            ));
        }

        Test.startTest();
        insert leads;
        Test.stopTest();

        List<Lead> insertedLeads = [SELECT OwnerId FROM Lead WHERE Id IN :leads ORDER BY CreatedDate ASC];
        for (Integer i = 0; i < insertedLeads.size(); i++) {
            Id expectedOwner = members[Math.mod(i, memberCount)].User__c;
            System.assertEquals(expectedOwner, insertedLeads[i].OwnerId,
                'Lead ' + i + ' should be assigned to member at position ' + Math.mod(i, memberCount));
        }

        List<Round_Robin_Member__c> updatedMembers = [
            SELECT Assignment_Count__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC
        ];
        for (Round_Robin_Member__c member : updatedMembers) {
            System.assert(member.Assignment_Count__c > 0, 'Each member should have assignments');
        }
    }

    @IsTest
    static void testWrapAround() {
        List<Round_Robin_Member__c> members = [
            SELECT Id, User__c, Sort_Order__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC
        ];
        Round_Robin_Queue__c queue = [SELECT Id FROM Round_Robin_Queue__c LIMIT 1];
        queue.Last_Assigned_Index__c = members[members.size() - 1].Sort_Order__c;
        update queue;

        Test.startTest();
        Lead ld = new Lead(LastName = 'Wrap', Company = 'Wrap Co', Status = 'Open - Not Contacted');
        insert ld;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :ld.Id];
        System.assertEquals(members[0].User__c, inserted.OwnerId,
            'Should wrap around to first member when past the last index');
    }

    @IsTest
    static void testUnavailableMemberSkipped() {
        List<Round_Robin_Member__c> members = [
            SELECT Id, User__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC
        ];
        Round_Robin_Member__c firstMember = members[0];
        firstMember.Is_Available__c = false;
        update firstMember;

        Test.startTest();
        Lead ld = new Lead(LastName = 'Skip', Company = 'Skip Co', Status = 'Open - Not Contacted');
        insert ld;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :ld.Id];
        System.assertEquals(members[1].User__c, inserted.OwnerId,
            'Should skip unavailable member and assign to next available');
    }

    @IsTest
    static void testNoEligibleMembers() {
        List<Round_Robin_Member__c> members = [SELECT Id FROM Round_Robin_Member__c];
        for (Round_Robin_Member__c member : members) {
            member.Is_Available__c = false;
        }
        update members;

        Test.startTest();
        Lead ld = new Lead(LastName = 'NoAssign', Company = 'NoAssign Co', Status = 'Open - Not Contacted');
        insert ld;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :ld.Id];
        System.assertNotEquals(null, inserted.OwnerId, 'Lead should still be created with default owner');
    }

    @IsTest
    static void testNoActiveQueue() {
        Round_Robin_Queue__c queue = [SELECT Id FROM Round_Robin_Queue__c LIMIT 1];
        queue.Active__c = false;
        update queue;

        Test.startTest();
        Lead ld = new Lead(LastName = 'NoQueue', Company = 'NoQueue Co', Status = 'Open - Not Contacted');
        insert ld;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :ld.Id];
        System.assertNotEquals(null, inserted.OwnerId, 'Lead should still be created when no active queue');
    }

    @IsTest
    static void testBypassFlag() {
        List<Round_Robin_Member__c> members = [
            SELECT User__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC
        ];

        RoundRobinHandler.bypassRoundRobin = true;

        Test.startTest();
        Lead ld = new Lead(LastName = 'Bypass', Company = 'Bypass Co', Status = 'Open - Not Contacted');
        insert ld;
        Test.stopTest();

        Lead inserted = [SELECT OwnerId FROM Lead WHERE Id = :ld.Id];
        System.assertNotEquals(members[0].User__c, inserted.OwnerId,
            'Lead should not be round-robin assigned when bypass is active');
    }

    @IsTest
    static void testControllerGetQueues() {
        Test.startTest();
        List<Round_Robin_Queue__c> queues = RoundRobinController.getQueues();
        Test.stopTest();

        System.assert(!queues.isEmpty(), 'Should return at least one queue');
        System.assertEquals(true, queues[0].Active__c, 'Active queue should be first');
    }

    @IsTest
    static void testControllerGetQueueMembers() {
        Round_Robin_Queue__c queue = [SELECT Id FROM Round_Robin_Queue__c LIMIT 1];

        Test.startTest();
        List<Round_Robin_Member__c> members = RoundRobinController.getQueueMembers(queue.Id);
        Test.stopTest();

        System.assert(!members.isEmpty(), 'Should return members for the queue');
        System.assertNotEquals(null, members[0].User__r.Name, 'Should include user name');
    }

    @IsTest
    static void testControllerToggleAvailability() {
        Round_Robin_Member__c member = [SELECT Id, Is_Available__c FROM Round_Robin_Member__c LIMIT 1];
        System.assertEquals(true, member.Is_Available__c);

        Test.startTest();
        RoundRobinController.toggleMemberAvailability(member.Id, false);
        Test.stopTest();

        member = [SELECT Is_Available__c FROM Round_Robin_Member__c WHERE Id = :member.Id];
        System.assertEquals(false, member.Is_Available__c, 'Availability should be toggled off');
    }

    @IsTest
    static void testControllerUpdateMemberOrder() {
        List<Round_Robin_Member__c> members = [
            SELECT Id FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC
        ];
        List<Id> reversedIds = new List<Id>();
        for (Integer i = members.size() - 1; i >= 0; i--) {
            reversedIds.add(members[i].Id);
        }

        Test.startTest();
        RoundRobinController.updateMemberOrder(reversedIds);
        Test.stopTest();

        List<Round_Robin_Member__c> reordered = [
            SELECT Id FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC
        ];
        System.assertEquals(reversedIds[0], reordered[0].Id, 'Order should be reversed');
    }

    @IsTest
    static void testControllerAddAndRemoveMember() {
        Round_Robin_Queue__c queue = [SELECT Id FROM Round_Robin_Queue__c LIMIT 1];
        User testUser = [SELECT Id FROM User WHERE IsActive = true AND Profile.Name = 'System Administrator' LIMIT 1];

        Test.startTest();
        Id newMemberId = RoundRobinController.addMember(queue.Id, testUser.Id);
        Test.stopTest();

        Round_Robin_Member__c added = [
            SELECT Sort_Order__c, Is_Available__c FROM Round_Robin_Member__c WHERE Id = :newMemberId
        ];
        System.assert(added.Sort_Order__c > 0, 'New member should have a sort order');
        System.assertEquals(true, added.Is_Available__c, 'New member should be available by default');

        RoundRobinController.removeMember(newMemberId);
        List<Round_Robin_Member__c> remaining = [
            SELECT Id FROM Round_Robin_Member__c WHERE Id = :newMemberId
        ];
        System.assert(remaining.isEmpty(), 'Member should be deleted');
    }
}
