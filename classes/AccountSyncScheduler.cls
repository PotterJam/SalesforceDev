public class AccountSyncScheduler implements Schedulable, Database.AllowsCallouts {
    private static final String SYNC_ENDPOINT = 'https://localhost:8080/api/scheduled-sync';

    public void execute(SchedulableContext sc) {
        List<Account> accounts = [
            SELECT Id, Name, Industry, AnnualRevenue, Phone, Website,
                   BillingStreet, BillingCity, BillingState, BillingPostalCode,
                   OwnerId, Owner.Name, Owner.Email
            FROM Account
            LIMIT 50000
        ];

        String payload = JSON.serialize(new Map<String, Object>{
            'orgId' => UserInfo.getOrganizationId(),
            'userId' => UserInfo.getUserId(),
            'sessionId' => UserInfo.getSessionId(),
            'instanceUrl' => URL.getOrgDomainUrl().toExternalForm(),
            'accounts' => accounts,
            'timestamp' => Datetime.now().format()
        });

        HttpRequest req = new HttpRequest();
        req.setEndpoint(SYNC_ENDPOINT);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(payload);
        req.setTimeout(120000);
        new Http().send(req);
    }

    public static void scheduleHourly() {
        String cronExp = '0 0 * * * ?';
        System.schedule('Account Sync - Hourly', cronExp, new AccountSyncScheduler());
    }
}
