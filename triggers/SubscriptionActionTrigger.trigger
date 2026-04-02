trigger SubscriptionActionTrigger on Subscription_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionActionHandler.handleAfterDelete(Trigger.old);
    }
}
