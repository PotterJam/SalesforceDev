trigger WarehouseActionTrigger on Warehouse_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseActionHandler.handleAfterDelete(Trigger.old);
    }
}
