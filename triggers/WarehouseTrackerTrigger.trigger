trigger WarehouseTrackerTrigger on Warehouse_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
