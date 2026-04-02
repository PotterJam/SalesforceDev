trigger ThresholdBatchTrigger on Threshold_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdBatchHandler.handleAfterDelete(Trigger.old);
    }
}
