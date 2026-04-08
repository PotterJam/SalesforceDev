trigger WarehouseStoreTrigger on Warehouse_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseStoreHandler.handleAfterDelete(Trigger.old);
    }
}
