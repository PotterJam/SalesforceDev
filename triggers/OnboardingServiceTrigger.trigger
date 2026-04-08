trigger OnboardingServiceTrigger on Onboarding_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingServiceHandler.handleAfterDelete(Trigger.old);
    }
}
