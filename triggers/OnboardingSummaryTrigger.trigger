trigger OnboardingSummaryTrigger on Onboarding_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
