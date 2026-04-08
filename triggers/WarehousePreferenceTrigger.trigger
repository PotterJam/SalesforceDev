trigger WarehousePreferenceTrigger on Warehouse_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WarehousePreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WarehousePreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehousePreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WarehousePreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WarehousePreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WarehousePreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
