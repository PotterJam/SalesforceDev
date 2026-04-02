trigger SubscriptionBridgeTrigger on Subscription_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
