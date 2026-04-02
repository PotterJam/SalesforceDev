trigger InvoiceControllerTrigger on Invoice_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceControllerHandler.handleAfterDelete(Trigger.old);
    }
}
