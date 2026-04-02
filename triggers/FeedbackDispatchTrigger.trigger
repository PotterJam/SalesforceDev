trigger FeedbackDispatchTrigger on Feedback_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
