trigger InvoiceConfigTrigger on Invoice_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceConfigHandler.handleAfterDelete(Trigger.old);
    }
}
