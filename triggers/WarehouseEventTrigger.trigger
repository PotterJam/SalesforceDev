trigger WarehouseEventTrigger on Warehouse_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseEventHandler.handleAfterDelete(Trigger.old);
    }
}
