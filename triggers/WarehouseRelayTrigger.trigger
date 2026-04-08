trigger WarehouseRelayTrigger on Warehouse_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseRelayHandler.handleAfterDelete(Trigger.old);
    }
}
