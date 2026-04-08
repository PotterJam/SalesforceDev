trigger InventoryServiceTrigger on Inventory_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryServiceHandler.handleAfterDelete(Trigger.old);
    }
}
