trigger InvoiceServiceTrigger on Invoice_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceServiceHandler.handleAfterDelete(Trigger.old);
    }
}
