trigger InventorySettingTrigger on Inventory_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventorySettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventorySettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventorySettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventorySettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventorySettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventorySettingHandler.handleAfterDelete(Trigger.old);
    }
}
