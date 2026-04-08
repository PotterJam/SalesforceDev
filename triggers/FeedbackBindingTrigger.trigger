trigger FeedbackBindingTrigger on Feedback_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackBindingHandler.handleAfterDelete(Trigger.old);
    }
}
