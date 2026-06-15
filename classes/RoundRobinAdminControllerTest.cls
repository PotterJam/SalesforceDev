@IsTest
private class RoundRobinAdminControllerTest {

    @TestSetup
    static void setupTestData() {
        Round_Robin_Group__c group1 = new Round_Robin_Group__c(
            Active__c = true,
            Priority__c = 1,
            Country_Criteria__c = 'US',
            Lead_Source_Criteria__c = 'Web',
            Rating_Criteria__c = '',
            Description__c = 'Test group for US web leads'
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

        insert new Round_Robin_Log__c(
            Group__c = group1.Id,
            Assigned_To__c = testUsers[0].Id,
            Status__c = 'Success',
            Assignment_Date__c = Datetime.now()
        );
    }

    @IsTest
    static void testGetGroups() {
        Test.startTest();
        List<Round_Robin_Group__c> groups = RoundRobinAdminController.getGroups();
        Test.stopTest();

        System.assert(!groups.isEmpty(), 'Should return at least one group');
        System.assertEquals(true, groups[0].Active__c, 'Group should be active');
    }

    @IsTest
    static void testSaveGroupCreate() {
        Round_Robin_Group__c newGroup = new Round_Robin_Group__c(
            Active__c = true,
            Priority__c = 5,
            Country_Criteria__c = 'UK',
            Description__c = 'UK group'
        );

        Test.startTest();
        Round_Robin_Group__c result = RoundRobinAdminController.saveGroup(newGroup);
        Test.stopTest();

        System.assertNotEquals(null, result.Id, 'Group should be inserted with an Id');
    }

    @IsTest
    static void testSaveGroupUpdate() {
        Round_Robin_Group__c existing = [SELECT Id, Description__c FROM Round_Robin_Group__c LIMIT 1];
        existing.Description__c = 'Updated description';

        Test.startTest();
        Round_Robin_Group__c result = RoundRobinAdminController.saveGroup(existing);
        Test.stopTest();

        Round_Robin_Group__c refreshed = [SELECT Description__c FROM Round_Robin_Group__c WHERE Id = :existing.Id];
        System.assertEquals('Updated description', refreshed.Description__c);
    }

    @IsTest
    static void testDeleteGroup() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];

        Test.startTest();
        RoundRobinAdminController.deleteGroup(group1.Id);
        Test.stopTest();

        List<Round_Robin_Group__c> remaining = [SELECT Id FROM Round_Robin_Group__c WHERE Id = :group1.Id];
        System.assertEquals(0, remaining.size(), 'Group should be deleted');
    }

    @IsTest
    static void testGetMembers() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];

        Test.startTest();
        List<Round_Robin_Member__c> members = RoundRobinAdminController.getMembers(group1.Id);
        Test.stopTest();

        System.assert(!members.isEmpty(), 'Should return members');
    }

    @IsTest
    static void testSaveMembers() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];
        List<Round_Robin_Member__c> members = [
            SELECT Id, Sort_Order__c FROM Round_Robin_Member__c WHERE Group__c = :group1.Id
        ];
        for (Round_Robin_Member__c m : members) {
            m.Sort_Order__c = m.Sort_Order__c + 10;
        }

        Test.startTest();
        List<Round_Robin_Member__c> result = RoundRobinAdminController.saveMembers(members);
        Test.stopTest();

        System.assertEquals(members.size(), result.size(), 'All members should be saved');
    }

    @IsTest
    static void testDeleteMember() {
        Round_Robin_Member__c member = [SELECT Id FROM Round_Robin_Member__c LIMIT 1];

        Test.startTest();
        RoundRobinAdminController.deleteMember(member.Id);
        Test.stopTest();

        List<Round_Robin_Member__c> remaining = [SELECT Id FROM Round_Robin_Member__c WHERE Id = :member.Id];
        System.assertEquals(0, remaining.size(), 'Member should be deleted');
    }

    @IsTest
    static void testGetLogs() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];

        Test.startTest();
        List<Round_Robin_Log__c> logs = RoundRobinAdminController.getLogs(group1.Id, 10);
        Test.stopTest();

        System.assert(!logs.isEmpty(), 'Should return log records');
    }

    @IsTest
    static void testGetLogsDefaultLimit() {
        Round_Robin_Group__c group1 = [SELECT Id FROM Round_Robin_Group__c LIMIT 1];

        Test.startTest();
        List<Round_Robin_Log__c> logs = RoundRobinAdminController.getLogs(group1.Id, null);
        Test.stopTest();

        System.assert(!logs.isEmpty(), 'Should return log records with default limit');
    }

    @IsTest
    static void testSearchUsers() {
        User currentUser = [SELECT Name FROM User WHERE Id = :UserInfo.getUserId()];
        String searchTerm = currentUser.Name.substring(0, 3);

        Test.startTest();
        List<User> results = RoundRobinAdminController.searchUsers(searchTerm);
        Test.stopTest();

        System.assert(!results.isEmpty(), 'Should find at least the current user');
    }

    @IsTest
    static void testSearchUsersTooShort() {
        Test.startTest();
        List<User> results = RoundRobinAdminController.searchUsers('a');
        Test.stopTest();

        System.assertEquals(0, results.size(), 'Should return empty for search term under 2 chars');
    }

    @IsTest
    static void testSearchUsersBlank() {
        Test.startTest();
        List<User> results = RoundRobinAdminController.searchUsers('');
        Test.stopTest();

        System.assertEquals(0, results.size(), 'Should return empty for blank search');
    }
}
