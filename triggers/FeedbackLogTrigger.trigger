trigger FeedbackLogTrigger on Feedback_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackLogHandler.handleAfterDelete(Trigger.old);
    }
}
