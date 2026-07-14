@isTest
private class OpportunityDiscountApprovalFlowTest {

    @isTest
    static void testSingleOpportunitySetsDiscountStatusToPendingApproval() {
        Opportunity opp = new Opportunity(
            Name = 'Test Discount Opp',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30),
            Discount_Requested__c = true,
            Discount_Status__c = null
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        Opportunity result = [SELECT Discount_Status__c FROM Opportunity WHERE Id = :opp.Id];
        System.assertEquals('Pending Approval', result.Discount_Status__c,
            'Discount_Status__c should be set to Pending Approval when a discount is requested');
    }

    @isTest
    static void testBulkOpportunitiesAllSetDiscountStatus() {
        List<Opportunity> opps = new List<Opportunity>();
        for (Integer i = 0; i < 200; i++) {
            opps.add(new Opportunity(
                Name = 'Bulk Discount Opp ' + i,
                StageName = 'Prospecting',
                CloseDate = Date.today().addDays(30),
                Discount_Requested__c = true,
                Discount_Status__c = null
            ));
        }

        Test.startTest();
        insert opps;
        Test.stopTest();

        List<Opportunity> results = [SELECT Discount_Status__c FROM Opportunity WHERE Id IN :opps];
        System.assertEquals(200, results.size(), 'All 200 opportunities should be retrieved');
        for (Opportunity result : results) {
            System.assertEquals('Pending Approval', result.Discount_Status__c,
                'Discount_Status__c should be Pending Approval for all bulk-inserted opportunities');
        }
    }

    @isTest
    static void testOpportunityWithoutDiscountRequestNotAffected() {
        Opportunity opp = new Opportunity(
            Name = 'No Discount Opp',
            StageName = 'Prospecting',
            CloseDate = Date.today().addDays(30),
            Discount_Requested__c = false,
            Discount_Status__c = null
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        Opportunity result = [SELECT Discount_Status__c FROM Opportunity WHERE Id = :opp.Id];
        System.assertNotEquals('Pending Approval', result.Discount_Status__c,
            'Discount_Status__c should not be set when Discount_Requested__c is false');
    }
}
