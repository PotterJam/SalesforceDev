trigger FeedbackSettingTrigger on Feedback_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackSettingHandler.handleAfterDelete(Trigger.old);
    }
}
