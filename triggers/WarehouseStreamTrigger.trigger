trigger WarehouseStreamTrigger on Warehouse_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseStreamHandler.handleAfterDelete(Trigger.old);
    }
}
