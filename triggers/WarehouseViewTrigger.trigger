trigger WarehouseViewTrigger on Warehouse_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseViewHandler.handleAfterDelete(Trigger.old);
    }
}
