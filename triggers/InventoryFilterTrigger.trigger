trigger InventoryFilterTrigger on Inventory_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryFilterHandler.handleAfterDelete(Trigger.old);
    }
}
