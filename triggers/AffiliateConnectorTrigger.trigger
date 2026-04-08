trigger AffiliateConnectorTrigger on Affiliate_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
