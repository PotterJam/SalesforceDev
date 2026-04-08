trigger OnboardingDetailTrigger on Onboarding_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingDetailHandler.handleAfterDelete(Trigger.old);
    }
}
