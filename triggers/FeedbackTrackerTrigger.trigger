trigger FeedbackTrackerTrigger on Feedback_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
