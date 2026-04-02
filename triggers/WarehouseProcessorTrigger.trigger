trigger WarehouseProcessorTrigger on Warehouse_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
