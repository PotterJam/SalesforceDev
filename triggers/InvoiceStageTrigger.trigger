trigger InvoiceStageTrigger on Invoice_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceStageHandler.handleAfterDelete(Trigger.old);
    }
}
