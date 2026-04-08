trigger ResourceBackupTrigger on Resource_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceBackupHandler.handleAfterDelete(Trigger.old);
    }
}
