trigger TrendBatchTrigger on Trend_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendBatchHandler.handleAfterDelete(Trigger.old);
    }
}
