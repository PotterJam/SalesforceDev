trigger InventoryCacheTrigger on Inventory_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryCacheHandler.handleAfterDelete(Trigger.old);
    }
}
