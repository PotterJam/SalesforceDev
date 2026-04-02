trigger InvoiceResponseTrigger on Invoice_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceResponseHandler.handleAfterDelete(Trigger.old);
    }
}
