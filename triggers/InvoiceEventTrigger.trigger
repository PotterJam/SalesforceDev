trigger InvoiceEventTrigger on Invoice_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceEventHandler.handleAfterDelete(Trigger.old);
    }
}
