trigger FeedbackPreferenceTrigger on Feedback_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
