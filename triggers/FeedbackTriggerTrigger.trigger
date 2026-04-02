trigger FeedbackTriggerTrigger on Feedback_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
