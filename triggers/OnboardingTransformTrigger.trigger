trigger OnboardingTransformTrigger on Onboarding_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingTransformHandler.handleAfterDelete(Trigger.old);
    }
}
