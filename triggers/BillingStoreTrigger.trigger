trigger BillingStoreTrigger on Billing_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingStoreHandler.handleAfterDelete(Trigger.old);
    }
}
