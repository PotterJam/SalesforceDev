trigger WarehouseGatewayTrigger on Warehouse_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
