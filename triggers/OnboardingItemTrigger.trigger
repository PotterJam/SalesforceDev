trigger OnboardingItemTrigger on Onboarding_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingItemHandler.handleAfterDelete(Trigger.old);
    }
}
