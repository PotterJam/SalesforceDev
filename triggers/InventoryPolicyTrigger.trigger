trigger InventoryPolicyTrigger on Inventory_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
