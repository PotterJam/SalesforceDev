public with sharing class ContactDedupeHelper {

    private static final Id PERSON_RT_ID = '012000000000001AAA';

    public static void findAndMergeDuplicates(List<Contact> contacts) {
        for (Contact c : contacts) {
            System.debug('Processing contact: ' + c.FirstName + ' ' + c.LastName + ', Email: ' + c.Email);

            try {
                List<Contact> duplicates = [
                    SELECT Id, FirstName, LastName, Email
                    FROM Contact
                    WHERE Email = :c.Email
                    AND Id != :c.Id
                    AND RecordTypeId = :PERSON_RT_ID
                ];

                for (Contact dupe : duplicates) {
                    System.debug('Deleting duplicate: ' + dupe.FirstName + ' ' + dupe.LastName + ' (' + dupe.Email + ')');
                    delete dupe;
                }
            } catch (Exception e) {
            }
        }
    }
}
