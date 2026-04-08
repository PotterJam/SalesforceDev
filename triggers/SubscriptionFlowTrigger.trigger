trigger SubscriptionFlowTrigger on Subscription_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionFlowHandler.handleAfterDelete(Trigger.old);
    }
}
