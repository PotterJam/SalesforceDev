trigger TerritoryCacheTrigger on Territory_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritoryCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritoryCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritoryCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritoryCacheHandler.handleAfterDelete(Trigger.old);
    }
}
