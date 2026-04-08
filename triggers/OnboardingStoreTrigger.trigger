trigger OnboardingStoreTrigger on Onboarding_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingStoreHandler.handleAfterDelete(Trigger.old);
    }
}
