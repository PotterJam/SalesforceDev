trigger BillingResponseTrigger on Billing_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingResponseHandler.handleAfterDelete(Trigger.old);
    }
}
