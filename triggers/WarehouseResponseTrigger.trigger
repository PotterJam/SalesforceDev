trigger WarehouseResponseTrigger on Warehouse_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseResponseHandler.handleAfterDelete(Trigger.old);
    }
}
