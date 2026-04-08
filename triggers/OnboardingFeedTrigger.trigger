trigger OnboardingFeedTrigger on Onboarding_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingFeedHandler.handleAfterDelete(Trigger.old);
    }
}
