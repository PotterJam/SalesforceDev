trigger SubscriptionLogTrigger on Subscription_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionLogHandler.handleAfterDelete(Trigger.old);
    }
}
