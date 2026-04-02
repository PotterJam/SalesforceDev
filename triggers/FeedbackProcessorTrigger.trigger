trigger FeedbackProcessorTrigger on Feedback_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
