trigger PaymentAuditTrigger on Payment_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PaymentAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PaymentAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PaymentAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PaymentAuditHandler.handleAfterDelete(Trigger.old);
    }
}
