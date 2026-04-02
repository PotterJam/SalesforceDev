trigger SubscriptionFeedTrigger on Subscription_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionFeedHandler.handleAfterDelete(Trigger.old);
    }
}
