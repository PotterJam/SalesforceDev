trigger ContractBackupTrigger on Contract_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ContractBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ContractBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ContractBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ContractBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ContractBackupHandler.handleAfterDelete(Trigger.old);
    }
}
