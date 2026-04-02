trigger FeedbackControllerTrigger on Feedback_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackControllerHandler.handleAfterDelete(Trigger.old);
    }
}
