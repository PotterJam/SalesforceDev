trigger RatingBatchTrigger on Rating_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingBatchHandler.handleAfterDelete(Trigger.old);
    }
}
