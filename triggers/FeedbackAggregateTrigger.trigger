trigger FeedbackAggregateTrigger on Feedback_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
