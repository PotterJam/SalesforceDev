trigger BillingDispatchTrigger on Billing_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
