trigger FeedbackHookTrigger on Feedback_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackHookHandler.handleAfterDelete(Trigger.old);
    }
}
