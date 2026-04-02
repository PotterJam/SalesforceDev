trigger WarehousePluginTrigger on Warehouse_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehousePluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehousePluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehousePluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehousePluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehousePluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehousePluginHandler.handleAfterDelete(Trigger.old);
    }
}
