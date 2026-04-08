trigger InventoryRegistryTrigger on Inventory_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
