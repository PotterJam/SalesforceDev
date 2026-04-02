trigger InvoiceBatchTrigger on Invoice_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InvoiceBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InvoiceBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InvoiceBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InvoiceBatchHandler.handleAfterDelete(Trigger.old);
    }
}
