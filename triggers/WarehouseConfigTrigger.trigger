trigger WarehouseConfigTrigger on Warehouse_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseConfigHandler.handleAfterDelete(Trigger.old);
    }
}
