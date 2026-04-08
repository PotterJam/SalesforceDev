trigger FeedbackPluginTrigger on Feedback_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackPluginHandler.handleAfterDelete(Trigger.old);
    }
}
