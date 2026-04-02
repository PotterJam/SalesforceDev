trigger InventoryFlowTrigger on Inventory_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryFlowHandler.handleAfterDelete(Trigger.old);
    }
}
