trigger PayrollBackupTrigger on Payroll_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PayrollBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PayrollBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PayrollBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PayrollBackupHandler.handleAfterDelete(Trigger.old);
    }
}
