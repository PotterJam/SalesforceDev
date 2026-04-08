trigger FeedbackPolicyTrigger on Feedback_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
