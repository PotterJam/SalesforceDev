@isTest(SeeAllData=true)
private class ContactDedupeHelperTest {

    @isTest
    static void testFindAndMergeDuplicates() {
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact LIMIT 10];
        ContactDedupeHelper.findAndMergeDuplicates(contacts);
    }
}
