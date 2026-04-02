trigger InventoryTransformTrigger on Inventory_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryTransformHandler.handleAfterDelete(Trigger.old);
    }
}
