trigger WarehouseModelTrigger on Warehouse_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseModelHandler.handleAfterDelete(Trigger.old);
    }
}
