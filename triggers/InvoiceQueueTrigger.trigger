trigger InvoiceQueueTrigger on Invoice_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceQueueHandler.handleAfterDelete(Trigger.old);
    }
}
