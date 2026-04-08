trigger OnboardingRegistryTrigger on Onboarding_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
