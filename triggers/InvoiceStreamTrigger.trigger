trigger InvoiceStreamTrigger on Invoice_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceStreamHandler.handleAfterDelete(Trigger.old);
    }
}
