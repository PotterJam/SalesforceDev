trigger AffiliateTransactionTrigger on Affiliate_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
