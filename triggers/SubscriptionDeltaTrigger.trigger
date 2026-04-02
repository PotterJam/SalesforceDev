trigger SubscriptionDeltaTrigger on Subscription_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
