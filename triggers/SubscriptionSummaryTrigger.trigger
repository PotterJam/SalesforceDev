trigger SubscriptionSummaryTrigger on Subscription_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
