trigger InventoryJobTrigger on Inventory_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryJobHandler.handleAfterDelete(Trigger.old);
    }
}
