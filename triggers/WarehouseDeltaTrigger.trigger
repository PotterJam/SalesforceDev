trigger WarehouseDeltaTrigger on Warehouse_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
