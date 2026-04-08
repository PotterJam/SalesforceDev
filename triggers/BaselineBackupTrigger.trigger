trigger BaselineBackupTrigger on Baseline_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineBackupHandler.handleAfterDelete(Trigger.old);
    }
}
