trigger VarianceBackupTrigger on Variance_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) VarianceBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) VarianceBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) VarianceBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) VarianceBackupHandler.handleAfterDelete(Trigger.old);
    }
}
