trigger RangeBackupTrigger on Range_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeBackupHandler.handleAfterDelete(Trigger.old);
    }
}
