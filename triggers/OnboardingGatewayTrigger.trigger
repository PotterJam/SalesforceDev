trigger OnboardingGatewayTrigger on Onboarding_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OnboardingGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OnboardingGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OnboardingGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OnboardingGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
