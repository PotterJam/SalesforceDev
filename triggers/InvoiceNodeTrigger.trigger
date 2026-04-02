trigger InvoiceNodeTrigger on Invoice_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceNodeHandler.handleAfterDelete(Trigger.old);
    }
}
