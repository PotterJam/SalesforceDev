trigger FeedbackAuditTrigger on Feedback_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackAuditHandler.handleAfterDelete(Trigger.old);
    }
}
