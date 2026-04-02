trigger OnboardingBackupTrigger on Onboarding_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingBackupHandler.handleAfterDelete(Trigger.old);
    }
}
