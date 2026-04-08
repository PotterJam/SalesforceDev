trigger InvoiceActionTrigger on Invoice_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceActionHandler.handleAfterDelete(Trigger.old);
    }
}
