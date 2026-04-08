trigger BillingHandlerTrigger on Billing_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
