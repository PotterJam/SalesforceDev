trigger InvoiceModelTrigger on Invoice_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceModelHandler.handleAfterDelete(Trigger.old);
    }
}
