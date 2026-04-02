trigger OnboardingSnapshotTrigger on Onboarding_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
