trigger FeedbackFeedTrigger on Feedback_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackFeedHandler.handleAfterDelete(Trigger.old);
    }
}
