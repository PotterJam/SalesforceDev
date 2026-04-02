trigger SubscriptionViewTrigger on Subscription_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionViewHandler.handleAfterDelete(Trigger.old);
    }
}
