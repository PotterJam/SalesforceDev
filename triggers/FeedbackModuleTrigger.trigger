trigger FeedbackModuleTrigger on Feedback_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackModuleHandler.handleAfterDelete(Trigger.old);
    }
}
