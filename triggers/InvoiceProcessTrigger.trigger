trigger InvoiceProcessTrigger on Invoice_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceProcessHandler.handleAfterDelete(Trigger.old);
    }
}
