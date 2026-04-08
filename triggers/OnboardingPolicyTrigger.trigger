trigger OnboardingPolicyTrigger on Onboarding_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
