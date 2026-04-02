trigger BillingRequestTrigger on Billing_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRequestHandler.handleAfterDelete(Trigger.old);
    }
}
