trigger StatusBatchTrigger on Status_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusBatchHandler.handleAfterDelete(Trigger.old);
    }
}
