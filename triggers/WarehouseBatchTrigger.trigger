trigger WarehouseBatchTrigger on Warehouse_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseBatchHandler.handleAfterDelete(Trigger.old);
    }
}
