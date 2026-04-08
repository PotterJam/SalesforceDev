trigger SubscriptionTransformTrigger on Subscription_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionTransformHandler.handleAfterDelete(Trigger.old);
    }
}
