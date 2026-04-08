trigger ProductBackupTrigger on Product_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductBackupHandler.handleAfterDelete(Trigger.old);
    }
}
