trigger OnboardingMappingTrigger on Onboarding_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingMappingHandler.handleAfterDelete(Trigger.old);
    }
}
