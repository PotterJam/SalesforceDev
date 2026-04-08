trigger TrainingBackupTrigger on Training_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingBackupHandler.handleAfterDelete(Trigger.old);
    }
}
