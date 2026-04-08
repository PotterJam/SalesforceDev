trigger WarehouseArchiveTrigger on Warehouse_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
