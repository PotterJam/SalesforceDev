trigger WarehouseFlowTrigger on Warehouse_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseFlowHandler.handleAfterDelete(Trigger.old);
    }
}
