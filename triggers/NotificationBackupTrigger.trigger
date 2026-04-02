trigger NotificationBackupTrigger on Notification_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationBackupHandler.handleAfterDelete(Trigger.old);
    }
}
