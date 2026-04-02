trigger BillingAuditTrigger on Billing_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BillingAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BillingAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BillingAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BillingAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BillingAuditHandler.handleAfterDelete(Trigger.old);
    }
}
