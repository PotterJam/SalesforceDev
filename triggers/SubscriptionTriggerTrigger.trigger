trigger SubscriptionTriggerTrigger on Subscription_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
