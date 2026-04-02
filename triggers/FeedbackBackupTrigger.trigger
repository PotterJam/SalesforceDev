trigger FeedbackBackupTrigger on Feedback_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FeedbackBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FeedbackBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FeedbackBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FeedbackBackupHandler.handleAfterDelete(Trigger.old);
    }
}
