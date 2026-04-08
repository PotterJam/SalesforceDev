trigger WarehouseCacheTrigger on Warehouse_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseCacheHandler.handleAfterDelete(Trigger.old);
    }
}
