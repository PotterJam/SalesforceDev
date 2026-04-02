trigger InventoryResponseTrigger on Inventory_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryResponseHandler.handleAfterDelete(Trigger.old);
    }
}
