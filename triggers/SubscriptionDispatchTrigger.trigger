trigger SubscriptionDispatchTrigger on Subscription_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
