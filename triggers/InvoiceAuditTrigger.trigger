trigger InvoiceAuditTrigger on Invoice_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceAuditHandler.handleAfterDelete(Trigger.old);
    }
}
