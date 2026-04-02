trigger InvoiceDetailTrigger on Invoice_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceDetailHandler.handleAfterDelete(Trigger.old);
    }
}
