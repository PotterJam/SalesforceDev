trigger FeedbackRegistryTrigger on Feedback_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
