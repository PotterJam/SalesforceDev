trigger InventoryAdapterTrigger on Inventory_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
