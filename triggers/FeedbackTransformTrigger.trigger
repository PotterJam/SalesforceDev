trigger FeedbackTransformTrigger on Feedback_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackTransformHandler.handleAfterDelete(Trigger.old);
    }
}
