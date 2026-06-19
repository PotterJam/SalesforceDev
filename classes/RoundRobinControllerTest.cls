@isTest
private class RoundRobinControllerTest {

    @TestSetup
    static void setupTestData() {
        Round_Robin_Config__c config = new Round_Robin_Config__c(
            Is_Active__c = true,
            Description__c = 'Test config'
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
    static void getConfig_returnsActiveConfig() {
        Test.startTest();
        Round_Robin_Config__c config = RoundRobinController.getConfig();
        Test.stopTest();

        System.assertNotEquals(null, config);
        System.assertEquals(true, config.Is_Active__c);
    }

    @isTest
    static void getConfig_noActiveConfig_returnsNull() {
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];
        config.Is_Active__c = false;
        update config;

        Test.startTest();
        Round_Robin_Config__c result = RoundRobinController.getConfig();
        Test.stopTest();

        System.assertEquals(null, result);
    }

    @isTest
    static void getMembers_returnsMembersInOrder() {
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];

        Test.startTest();
        List<Round_Robin_Member__c> members = RoundRobinController.getMembers(config.Id);
        Test.stopTest();

        System.assert(members.size() > 0);
        for (Integer i = 1; i < members.size(); i++) {
            System.assert(members[i].Sort_Order__c >= members[i-1].Sort_Order__c);
        }
    }

    @isTest
    static void saveMember_insertsNewMember() {
        Round_Robin_Config__c config = [SELECT Id FROM Round_Robin_Config__c LIMIT 1];
        User newUser = [SELECT Id FROM User WHERE IsActive = true LIMIT 1];

        Round_Robin_Member__c newMember = new Round_Robin_Member__c(
            Round_Robin_Config__c = config.Id,
            User__c = newUser.Id,
            Is_Available__c = true,
            Sort_Order__c = 99
        );

        Test.startTest();
        Round_Robin_Member__c saved = RoundRobinController.saveMember(newMember);
        Test.stopTest();

        System.assertNotEquals(null, saved.Id);
    }

    @isTest
    static void deleteMember_removesMember() {
        Round_Robin_Member__c member = [SELECT Id FROM Round_Robin_Member__c LIMIT 1];

        Test.startTest();
        RoundRobinController.deleteMember(member.Id);
        Test.stopTest();

        List<Round_Robin_Member__c> remaining = [SELECT Id FROM Round_Robin_Member__c WHERE Id = :member.Id];
        System.assertEquals(0, remaining.size());
    }

    @isTest
    static void toggleAvailability_updatesFlag() {
        Round_Robin_Member__c member = [SELECT Id, Is_Available__c FROM Round_Robin_Member__c LIMIT 1];
        System.assertEquals(true, member.Is_Available__c);

        Test.startTest();
        RoundRobinController.toggleAvailability(member.Id, false);
        Test.stopTest();

        Round_Robin_Member__c updated = [SELECT Is_Available__c FROM Round_Robin_Member__c WHERE Id = :member.Id];
        System.assertEquals(false, updated.Is_Available__c);
    }

    @isTest
    static void updateSortOrder_reordersMembers() {
        List<Round_Robin_Member__c> members = [SELECT Id FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC];
        List<Id> reversedIds = new List<Id>();
        for (Integer i = members.size() - 1; i >= 0; i--) {
            reversedIds.add(members[i].Id);
        }

        Test.startTest();
        RoundRobinController.updateSortOrder(reversedIds);
        Test.stopTest();

        List<Round_Robin_Member__c> reordered = [SELECT Id, Sort_Order__c FROM Round_Robin_Member__c ORDER BY Sort_Order__c ASC];
        System.assertEquals(reversedIds[0], reordered[0].Id);
        System.assertEquals(1, reordered[0].Sort_Order__c);
    }

    @isTest
    static void searchUsers_returnsActiveUsers() {
        User activeUser = [SELECT Name FROM User WHERE IsActive = true LIMIT 1];
        String searchTerm = activeUser.Name.substring(0, 3);

        Test.startTest();
        List<User> results = RoundRobinController.searchUsers(searchTerm);
        Test.stopTest();

        System.assert(results.size() > 0);
        for (User u : results) {
            System.assertEquals(true, u.IsActive);
        }
    }
}
