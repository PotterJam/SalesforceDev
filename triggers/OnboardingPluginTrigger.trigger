trigger OnboardingPluginTrigger on Onboarding_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingPluginHandler.handleAfterDelete(Trigger.old);
    }
}
