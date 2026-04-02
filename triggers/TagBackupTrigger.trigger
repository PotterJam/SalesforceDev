trigger TagBackupTrigger on Tag_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagBackupHandler.handleAfterDelete(Trigger.old);
    }
}
