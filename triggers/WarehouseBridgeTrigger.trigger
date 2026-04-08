trigger WarehouseBridgeTrigger on Warehouse_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
