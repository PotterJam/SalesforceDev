trigger SubscriptionFilterTrigger on Subscription_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionFilterHandler.handleAfterDelete(Trigger.old);
    }
}
