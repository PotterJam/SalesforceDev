trigger OnboardingResponseTrigger on Onboarding_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingResponseHandler.handleAfterDelete(Trigger.old);
    }
}
