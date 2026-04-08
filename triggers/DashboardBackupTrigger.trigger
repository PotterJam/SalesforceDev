trigger DashboardBackupTrigger on Dashboard_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DashboardBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DashboardBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DashboardBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DashboardBackupHandler.handleAfterDelete(Trigger.old);
    }
}
