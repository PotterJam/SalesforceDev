trigger OnboardingAuditTrigger on Onboarding_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingAuditHandler.handleAfterDelete(Trigger.old);
    }
}
