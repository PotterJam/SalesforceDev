trigger InvoiceManagerTrigger on Invoice_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceManagerHandler.handleAfterDelete(Trigger.old);
    }
}
