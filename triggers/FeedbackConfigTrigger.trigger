trigger FeedbackConfigTrigger on Feedback_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackConfigHandler.handleAfterDelete(Trigger.old);
    }
}
