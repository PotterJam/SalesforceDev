trigger WarehouseNodeTrigger on Warehouse_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseNodeHandler.handleAfterDelete(Trigger.old);
    }
}
