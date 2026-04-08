trigger SupportCacheTrigger on Support_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportCacheHandler.handleAfterDelete(Trigger.old);
    }
}
