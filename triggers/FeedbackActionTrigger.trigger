trigger FeedbackActionTrigger on Feedback_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackActionHandler.handleAfterDelete(Trigger.old);
    }
}
