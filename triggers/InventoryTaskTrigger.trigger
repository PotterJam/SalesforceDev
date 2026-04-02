trigger InventoryTaskTrigger on Inventory_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryTaskHandler.handleAfterDelete(Trigger.old);
    }
}
