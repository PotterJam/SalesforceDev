trigger WarehouseTaskTrigger on Warehouse_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseTaskHandler.handleAfterDelete(Trigger.old);
    }
}
