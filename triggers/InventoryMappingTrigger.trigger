trigger InventoryMappingTrigger on Inventory_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryMappingHandler.handleAfterDelete(Trigger.old);
    }
}
