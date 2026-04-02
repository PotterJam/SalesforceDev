trigger BillingCacheTrigger on Billing_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingCacheHandler.handleAfterDelete(Trigger.old);
    }
}
