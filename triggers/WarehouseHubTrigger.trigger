trigger WarehouseHubTrigger on Warehouse_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseHubHandler.handleAfterDelete(Trigger.old);
    }
}
