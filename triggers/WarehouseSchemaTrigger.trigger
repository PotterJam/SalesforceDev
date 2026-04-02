trigger WarehouseSchemaTrigger on Warehouse_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
