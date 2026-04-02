trigger ActualBatchTrigger on Actual_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualBatchHandler.handleAfterDelete(Trigger.old);
    }
}
