trigger FeedbackEntryTrigger on Feedback_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackEntryHandler.handleAfterDelete(Trigger.old);
    }
}
