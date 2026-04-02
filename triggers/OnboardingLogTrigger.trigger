trigger OnboardingLogTrigger on Onboarding_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingLogHandler.handleAfterDelete(Trigger.old);
    }
}
