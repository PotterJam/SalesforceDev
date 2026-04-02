trigger InventoryProxyTrigger on Inventory_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryProxyHandler.handleAfterDelete(Trigger.old);
    }
}
