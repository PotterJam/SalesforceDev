trigger InventoryArchiveTrigger on Inventory_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
