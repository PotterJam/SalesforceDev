trigger FeedbackServiceTrigger on Feedback_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackServiceHandler.handleAfterDelete(Trigger.old);
    }
}
