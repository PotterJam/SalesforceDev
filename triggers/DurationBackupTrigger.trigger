trigger DurationBackupTrigger on Duration_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationBackupHandler.handleAfterDelete(Trigger.old);
    }
}
