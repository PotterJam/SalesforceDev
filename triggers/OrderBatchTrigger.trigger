trigger OrderBatchTrigger on Order_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderBatchHandler.handleAfterDelete(Trigger.old);
    }
}
