trigger FeedbackSchemaTrigger on Feedback_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
