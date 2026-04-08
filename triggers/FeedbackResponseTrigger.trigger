trigger FeedbackResponseTrigger on Feedback_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackResponseHandler.handleAfterDelete(Trigger.old);
    }
}
