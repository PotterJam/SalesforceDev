trigger CoverageBackupTrigger on Coverage_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageBackupHandler.handleAfterDelete(Trigger.old);
    }
}
