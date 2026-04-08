trigger SupportBackupTrigger on Support_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportBackupHandler.handleAfterDelete(Trigger.old);
    }
}
