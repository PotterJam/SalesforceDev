trigger FeedbackTransactionTrigger on Feedback_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
