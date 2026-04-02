trigger SubscriptionProcessTrigger on Subscription_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionProcessHandler.handleAfterDelete(Trigger.old);
    }
}
