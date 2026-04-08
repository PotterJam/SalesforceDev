trigger QuotaBackupTrigger on Quota_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaBackupHandler.handleAfterDelete(Trigger.old);
    }
}
