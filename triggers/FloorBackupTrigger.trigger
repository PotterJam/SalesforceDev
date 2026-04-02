trigger FloorBackupTrigger on Floor_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorBackupHandler.handleAfterDelete(Trigger.old);
    }
}
