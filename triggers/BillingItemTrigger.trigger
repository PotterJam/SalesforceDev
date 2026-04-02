trigger BillingItemTrigger on Billing_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingItemHandler.handleAfterDelete(Trigger.old);
    }
}
