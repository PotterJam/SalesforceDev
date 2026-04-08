trigger TierCacheTrigger on Tier_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierCacheHandler.handleAfterDelete(Trigger.old);
    }
}
