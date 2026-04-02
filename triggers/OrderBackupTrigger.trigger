trigger OrderBackupTrigger on Order_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderBackupHandler.handleAfterDelete(Trigger.old);
    }
}
