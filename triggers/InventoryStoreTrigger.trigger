trigger InventoryStoreTrigger on Inventory_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryStoreHandler.handleAfterDelete(Trigger.old);
    }
}
