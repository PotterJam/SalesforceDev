trigger InvoiceViewTrigger on Invoice_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceViewHandler.handleAfterDelete(Trigger.old);
    }
}
