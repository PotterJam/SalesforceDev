trigger FeedbackStoreTrigger on Feedback_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackStoreHandler.handleAfterDelete(Trigger.old);
    }
}
