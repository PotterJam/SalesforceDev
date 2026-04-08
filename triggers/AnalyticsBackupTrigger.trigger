trigger AnalyticsBackupTrigger on Analytics_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsBackupHandler.handleAfterDelete(Trigger.old);
    }
}
