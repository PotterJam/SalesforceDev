trigger SubscriptionPlanTrigger on Subscription_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionPlanHandler.handleAfterDelete(Trigger.old);
    }
}
