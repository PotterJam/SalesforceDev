trigger InventoryConfigTrigger on Inventory_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryConfigHandler.handleAfterDelete(Trigger.old);
    }
}
