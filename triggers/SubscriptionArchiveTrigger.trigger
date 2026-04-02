trigger SubscriptionArchiveTrigger on Subscription_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
