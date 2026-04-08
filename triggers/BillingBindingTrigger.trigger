trigger BillingBindingTrigger on Billing_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingBindingHandler.handleAfterDelete(Trigger.old);
    }
}
