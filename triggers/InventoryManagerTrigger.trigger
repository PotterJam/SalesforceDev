trigger InventoryManagerTrigger on Inventory_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryManagerHandler.handleAfterDelete(Trigger.old);
    }
}
