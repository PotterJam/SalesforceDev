trigger WarehouseRequestTrigger on Warehouse_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseRequestHandler.handleAfterDelete(Trigger.old);
    }
}
