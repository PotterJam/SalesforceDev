trigger InventoryFeedTrigger on Inventory_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryFeedHandler.handleAfterDelete(Trigger.old);
    }
}
