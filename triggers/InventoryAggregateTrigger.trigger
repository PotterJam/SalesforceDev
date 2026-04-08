trigger InventoryAggregateTrigger on Inventory_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
