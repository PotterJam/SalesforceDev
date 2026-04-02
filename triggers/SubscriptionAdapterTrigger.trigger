trigger SubscriptionAdapterTrigger on Subscription_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
