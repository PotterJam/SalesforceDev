trigger FeedbackRouteTrigger on Feedback_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackRouteHandler.handleAfterDelete(Trigger.old);
    }
}
