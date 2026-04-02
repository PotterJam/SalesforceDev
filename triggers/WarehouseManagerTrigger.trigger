trigger WarehouseManagerTrigger on Warehouse_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseManagerHandler.handleAfterDelete(Trigger.old);
    }
}
