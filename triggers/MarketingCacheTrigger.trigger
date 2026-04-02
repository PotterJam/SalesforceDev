trigger MarketingCacheTrigger on Marketing_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingCacheHandler.handleAfterDelete(Trigger.old);
    }
}
