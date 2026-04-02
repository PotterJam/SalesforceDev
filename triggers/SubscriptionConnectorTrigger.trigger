trigger SubscriptionConnectorTrigger on Subscription_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
