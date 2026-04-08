trigger OnboardingBindingTrigger on Onboarding_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingBindingHandler.handleAfterDelete(Trigger.old);
    }
}
