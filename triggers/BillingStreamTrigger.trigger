trigger BillingStreamTrigger on Billing_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingStreamHandler.handleAfterDelete(Trigger.old);
    }
}
