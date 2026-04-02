trigger InventoryEntryTrigger on Inventory_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryEntryHandler.handleAfterDelete(Trigger.old);
    }
}
