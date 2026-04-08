trigger CapacityBackupTrigger on Capacity_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacityBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacityBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacityBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacityBackupHandler.handleAfterDelete(Trigger.old);
    }
}
