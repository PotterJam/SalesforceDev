trigger WarehouseRouteTrigger on Warehouse_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseRouteHandler.handleAfterDelete(Trigger.old);
    }
}
