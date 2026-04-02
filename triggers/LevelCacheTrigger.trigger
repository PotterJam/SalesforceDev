trigger LevelCacheTrigger on Level_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelCacheHandler.handleAfterDelete(Trigger.old);
    }
}
