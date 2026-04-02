trigger OnboardingCacheTrigger on Onboarding_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingCacheHandler.handleAfterDelete(Trigger.old);
    }
}
