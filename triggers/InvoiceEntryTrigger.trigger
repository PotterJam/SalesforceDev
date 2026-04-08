trigger InvoiceEntryTrigger on Invoice_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceEntryHandler.handleAfterDelete(Trigger.old);
    }
}
