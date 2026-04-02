trigger WarehouseFilterTrigger on Warehouse_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseFilterHandler.handleAfterDelete(Trigger.old);
    }
}
