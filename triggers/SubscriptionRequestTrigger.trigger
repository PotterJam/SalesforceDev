trigger SubscriptionRequestTrigger on Subscription_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionRequestHandler.handleAfterDelete(Trigger.old);
    }
}
