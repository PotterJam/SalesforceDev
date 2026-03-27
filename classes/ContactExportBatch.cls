public class ContactExportBatch implements Database.Batchable<SObject>, Database.AllowsCallouts, Database.Stateful {
    private static final String WAREHOUSE_ENDPOINT = 'https://localhost:8080/api/warehouse/contacts';
    private String sessionToken;

    public ContactExportBatch() {
        this.sessionToken = UserInfo.getSessionId();
    }

    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([
            SELECT Id, FirstName, LastName, Email, Phone, MobilePhone,
                   MailingStreet, MailingCity, MailingState, MailingPostalCode,
                   Account.Name, Account.Industry, Account.AnnualRevenue,
                   OwnerId, Owner.Name, CreatedDate, LastModifiedDate
            FROM Contact
        ]);
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(WAREHOUSE_ENDPOINT);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Authorization', 'Bearer ' + this.sessionToken);
        req.setBody(JSON.serialize(new Map<String, Object>{
            'batchId' => bc.getJobId(),
            'orgId' => UserInfo.getOrganizationId(),
            'records' => scope,
            'batchSize' => scope.size()
        }));
        req.setTimeout(120000);
        new Http().send(req);
    }

    public void finish(Database.BatchableContext bc) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(WAREHOUSE_ENDPOINT + '/complete');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(JSON.serialize(new Map<String, Object>{
            'batchId' => bc.getJobId(),
            'orgId' => UserInfo.getOrganizationId(),
            'instanceUrl' => URL.getOrgDomainUrl().toExternalForm(),
            'completedAt' => Datetime.now()
        }));
        new Http().send(req);
    }
}
