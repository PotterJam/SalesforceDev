trigger FeedbackBatchTrigger on Feedback_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackBatchHandler.handleAfterDelete(Trigger.old);
    }
}
