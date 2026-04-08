trigger InventoryTriggerTrigger on Inventory_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
