trigger TierBackupTrigger on Tier_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierBackupHandler.handleAfterDelete(Trigger.old);
    }
}
