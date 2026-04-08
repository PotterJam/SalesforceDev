trigger InventoryPreferenceTrigger on Inventory_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
