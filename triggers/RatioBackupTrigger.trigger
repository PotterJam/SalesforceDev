trigger RatioBackupTrigger on Ratio_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioBackupHandler.handleAfterDelete(Trigger.old);
    }
}
