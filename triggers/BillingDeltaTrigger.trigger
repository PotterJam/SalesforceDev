trigger BillingDeltaTrigger on Billing_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
