trigger InvoiceHandlerTrigger on Invoice_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
