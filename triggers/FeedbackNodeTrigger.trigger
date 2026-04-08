trigger FeedbackNodeTrigger on Feedback_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackNodeHandler.handleAfterDelete(Trigger.old);
    }
}
