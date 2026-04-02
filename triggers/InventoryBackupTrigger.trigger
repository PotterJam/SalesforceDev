trigger InventoryBackupTrigger on Inventory_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) InventoryBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) InventoryBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) InventoryBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) InventoryBackupHandler.handleAfterDelete(Trigger.old);
    }
}
