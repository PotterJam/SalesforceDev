trigger WarehouseHandlerTrigger on Warehouse_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
