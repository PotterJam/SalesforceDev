trigger FeedbackEventTrigger on Feedback_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackEventHandler.handleAfterDelete(Trigger.old);
    }
}
