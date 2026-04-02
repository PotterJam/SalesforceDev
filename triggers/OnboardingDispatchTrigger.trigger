trigger OnboardingDispatchTrigger on Onboarding_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
