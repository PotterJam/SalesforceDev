trigger DurationCacheTrigger on Duration_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationCacheHandler.handleAfterDelete(Trigger.old);
    }
}
