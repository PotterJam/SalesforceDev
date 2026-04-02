trigger FeedbackQueueTrigger on Feedback_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackQueueHandler.handleAfterDelete(Trigger.old);
    }
}
