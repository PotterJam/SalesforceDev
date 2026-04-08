trigger OnboardingProcessorTrigger on Onboarding_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
