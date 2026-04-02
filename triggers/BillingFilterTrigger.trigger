trigger BillingFilterTrigger on Billing_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingFilterHandler.handleAfterDelete(Trigger.old);
    }
}
