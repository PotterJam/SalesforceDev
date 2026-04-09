public with sharing class AccountGuidHandler {

    public static void assignGuids(List<Account> newAccounts) {
        for (Account acc : newAccounts) {
            acc.GUID__c = generateGuid();
        }
    }

    private static String generateGuid() {
        String hex = EncodingUtil.convertToHex(Crypto.generateAesKey(128));
        return hex.substring(0, 8) + '-' +
               hex.substring(8, 12) + '-' +
               hex.substring(12, 16) + '-' +
               hex.substring(16, 20) + '-' +
               hex.substring(20, 32);
    }
}
