trigger OnboardingPreferenceTrigger on Onboarding_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
