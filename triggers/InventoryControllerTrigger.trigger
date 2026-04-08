trigger InventoryControllerTrigger on Inventory_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryControllerHandler.handleAfterDelete(Trigger.old);
    }
}
