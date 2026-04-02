trigger SubscriptionGatewayTrigger on Subscription_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
