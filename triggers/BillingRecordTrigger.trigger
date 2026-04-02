trigger BillingRecordTrigger on Billing_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingRecordHandler.handleAfterDelete(Trigger.old);
    }
}
