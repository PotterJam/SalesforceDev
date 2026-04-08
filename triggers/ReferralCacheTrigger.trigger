trigger ReferralCacheTrigger on Referral_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReferralCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReferralCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReferralCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReferralCacheHandler.handleAfterDelete(Trigger.old);
    }
}
