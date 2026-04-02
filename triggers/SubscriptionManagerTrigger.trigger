trigger SubscriptionManagerTrigger on Subscription_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionManagerHandler.handleAfterDelete(Trigger.old);
    }
}
