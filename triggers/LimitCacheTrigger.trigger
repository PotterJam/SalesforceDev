trigger LimitCacheTrigger on Limit_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitCacheHandler.handleAfterDelete(Trigger.old);
    }
}
