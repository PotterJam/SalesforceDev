trigger WarehouseAuditTrigger on Warehouse_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseAuditHandler.handleAfterDelete(Trigger.old);
    }
}
