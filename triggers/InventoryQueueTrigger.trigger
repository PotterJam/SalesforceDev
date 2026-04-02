trigger InventoryQueueTrigger on Inventory_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryQueueHandler.handleAfterDelete(Trigger.old);
    }
}
