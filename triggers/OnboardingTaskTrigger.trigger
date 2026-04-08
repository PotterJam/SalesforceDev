trigger OnboardingTaskTrigger on Onboarding_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingTaskHandler.handleAfterDelete(Trigger.old);
    }
}
