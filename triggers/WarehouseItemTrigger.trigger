trigger WarehouseItemTrigger on Warehouse_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseItemHandler.handleAfterDelete(Trigger.old);
    }
}
