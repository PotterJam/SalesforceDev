trigger InventoryViewTrigger on Inventory_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryViewHandler.handleAfterDelete(Trigger.old);
    }
}
