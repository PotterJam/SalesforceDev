trigger ThresholdBackupTrigger on Threshold_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdBackupHandler.handleAfterDelete(Trigger.old);
    }
}
