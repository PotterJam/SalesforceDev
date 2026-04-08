trigger WarehouseControllerTrigger on Warehouse_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseControllerHandler.handleAfterDelete(Trigger.old);
    }
}
