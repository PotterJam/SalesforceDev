trigger SubscriptionRouteTrigger on Subscription_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionRouteHandler.handleAfterDelete(Trigger.old);
    }
}
