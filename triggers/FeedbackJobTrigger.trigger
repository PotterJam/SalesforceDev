trigger FeedbackJobTrigger on Feedback_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackJobHandler.handleAfterDelete(Trigger.old);
    }
}
