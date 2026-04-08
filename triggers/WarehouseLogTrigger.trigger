trigger WarehouseLogTrigger on Warehouse_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseLogHandler.handleAfterDelete(Trigger.old);
    }
}
