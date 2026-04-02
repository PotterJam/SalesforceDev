trigger SubscriptionEntryTrigger on Subscription_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionEntryHandler.handleAfterDelete(Trigger.old);
    }
}
