trigger TargetBackupTrigger on Target_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetBackupHandler.handleAfterDelete(Trigger.old);
    }
}
