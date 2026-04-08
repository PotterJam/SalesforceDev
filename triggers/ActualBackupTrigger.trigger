trigger ActualBackupTrigger on Actual_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualBackupHandler.handleAfterDelete(Trigger.old);
    }
}
