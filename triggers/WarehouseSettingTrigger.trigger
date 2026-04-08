trigger WarehouseSettingTrigger on Warehouse_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehouseSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehouseSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehouseSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehouseSettingHandler.handleAfterDelete(Trigger.old);
    }
}
