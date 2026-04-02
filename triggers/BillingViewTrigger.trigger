trigger BillingViewTrigger on Billing_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingViewHandler.handleAfterDelete(Trigger.old);
    }
}
