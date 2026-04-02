trigger OnboardingStreamTrigger on Onboarding_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingStreamHandler.handleAfterDelete(Trigger.old);
    }
}
