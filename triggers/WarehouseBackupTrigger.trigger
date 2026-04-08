trigger WarehouseBackupTrigger on Warehouse_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseBackupHandler.handleAfterDelete(Trigger.old);
    }
}
