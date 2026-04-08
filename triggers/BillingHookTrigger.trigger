trigger BillingHookTrigger on Billing_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingHookHandler.handleAfterDelete(Trigger.old);
    }
}
