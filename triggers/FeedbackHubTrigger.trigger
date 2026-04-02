trigger FeedbackHubTrigger on Feedback_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackHubHandler.handleAfterDelete(Trigger.old);
    }
}
