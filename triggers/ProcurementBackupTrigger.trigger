trigger ProcurementBackupTrigger on Procurement_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementBackupHandler.handleAfterDelete(Trigger.old);
    }
}
