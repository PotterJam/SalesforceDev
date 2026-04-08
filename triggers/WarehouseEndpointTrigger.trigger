trigger WarehouseEndpointTrigger on Warehouse_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
