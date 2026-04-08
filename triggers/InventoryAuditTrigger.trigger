trigger InventoryAuditTrigger on Inventory_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryAuditHandler.handleAfterDelete(Trigger.old);
    }
}
