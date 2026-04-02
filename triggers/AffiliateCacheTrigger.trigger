trigger AffiliateCacheTrigger on Affiliate_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AffiliateCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AffiliateCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AffiliateCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AffiliateCacheHandler.handleAfterDelete(Trigger.old);
    }
}
