trigger SubscriptionCacheTrigger on Subscription_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionCacheHandler.handleAfterDelete(Trigger.old);
    }
}
