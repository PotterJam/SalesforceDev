trigger SubscriptionTrackerTrigger on Subscription_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
