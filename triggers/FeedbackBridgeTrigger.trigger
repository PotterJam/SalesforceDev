trigger FeedbackBridgeTrigger on Feedback_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
