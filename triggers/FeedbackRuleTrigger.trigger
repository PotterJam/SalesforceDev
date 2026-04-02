trigger FeedbackRuleTrigger on Feedback_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackRuleHandler.handleAfterDelete(Trigger.old);
    }
}
