trigger OnboardingPlanTrigger on Onboarding_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingPlanHandler.handleAfterDelete(Trigger.old);
    }
}
