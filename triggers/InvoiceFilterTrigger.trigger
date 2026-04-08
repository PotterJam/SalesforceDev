trigger InvoiceFilterTrigger on Invoice_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceFilterHandler.handleAfterDelete(Trigger.old);
    }
}
