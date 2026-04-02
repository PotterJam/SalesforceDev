trigger InvoiceBindingTrigger on Invoice_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceBindingHandler.handleAfterDelete(Trigger.old);
    }
}
