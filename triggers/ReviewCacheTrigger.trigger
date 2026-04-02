trigger ReviewCacheTrigger on Review_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewCacheHandler.handleAfterDelete(Trigger.old);
    }
}
