trigger SubscriptionEventTrigger on Subscription_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionEventHandler.handleAfterDelete(Trigger.old);
    }
}
