trigger InventoryConnectorTrigger on Inventory_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
