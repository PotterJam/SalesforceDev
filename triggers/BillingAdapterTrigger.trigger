trigger BillingAdapterTrigger on Billing_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
