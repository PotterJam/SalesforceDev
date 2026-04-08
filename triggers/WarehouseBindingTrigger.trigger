trigger WarehouseBindingTrigger on Warehouse_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseBindingHandler.handleAfterDelete(Trigger.old);
    }
}
