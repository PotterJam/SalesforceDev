trigger OnboardingProxyTrigger on Onboarding_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingProxyHandler.handleAfterDelete(Trigger.old);
    }
}
