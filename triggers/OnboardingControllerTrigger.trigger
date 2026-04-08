trigger OnboardingControllerTrigger on Onboarding_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingControllerHandler.handleAfterDelete(Trigger.old);
    }
}
