trigger CategoryBackupTrigger on Category_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryBackupHandler.handleAfterDelete(Trigger.old);
    }
}
