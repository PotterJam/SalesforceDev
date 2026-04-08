trigger OnboardingHookTrigger on Onboarding_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingHookHandler.handleAfterDelete(Trigger.old);
    }
}
