trigger SubscriptionHubTrigger on Subscription_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionHubHandler.handleAfterDelete(Trigger.old);
    }
}
