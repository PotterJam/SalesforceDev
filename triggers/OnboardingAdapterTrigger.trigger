trigger OnboardingAdapterTrigger on Onboarding_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
