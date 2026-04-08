trigger FeedbackFilterTrigger on Feedback_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackFilterHandler.handleAfterDelete(Trigger.old);
    }
}
