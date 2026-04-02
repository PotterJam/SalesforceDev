trigger OnboardingLinkTrigger on Onboarding_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingLinkHandler.handleAfterDelete(Trigger.old);
    }
}
