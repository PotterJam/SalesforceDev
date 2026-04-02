trigger ResolutionBackupTrigger on Resolution_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionBackupHandler.handleAfterDelete(Trigger.old);
    }
}
