trigger WarehouseTransactionTrigger on Warehouse_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
