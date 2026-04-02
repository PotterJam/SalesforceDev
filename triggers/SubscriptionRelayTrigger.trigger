trigger SubscriptionRelayTrigger on Subscription_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionRelayHandler.handleAfterDelete(Trigger.old);
    }
}
