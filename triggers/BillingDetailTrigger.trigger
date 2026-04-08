trigger BillingDetailTrigger on Billing_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingDetailHandler.handleAfterDelete(Trigger.old);
    }
}
