trigger LimitBackupTrigger on Limit_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitBackupHandler.handleAfterDelete(Trigger.old);
    }
}
