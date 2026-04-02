trigger CommissionBackupTrigger on Commission_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionBackupHandler.handleAfterDelete(Trigger.old);
    }
}
