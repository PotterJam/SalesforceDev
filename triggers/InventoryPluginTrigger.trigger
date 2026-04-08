trigger InventoryPluginTrigger on Inventory_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryPluginHandler.handleAfterDelete(Trigger.old);
    }
}
