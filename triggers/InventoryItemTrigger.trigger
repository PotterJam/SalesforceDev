trigger InventoryItemTrigger on Inventory_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryItemHandler.handleAfterDelete(Trigger.old);
    }
}
