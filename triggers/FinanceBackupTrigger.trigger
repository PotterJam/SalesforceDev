trigger FinanceBackupTrigger on Finance_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FinanceBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FinanceBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FinanceBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FinanceBackupHandler.handleAfterDelete(Trigger.old);
    }
}
