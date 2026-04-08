trigger InvoiceFlowTrigger on Invoice_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceFlowHandler.handleAfterDelete(Trigger.old);
    }
}
