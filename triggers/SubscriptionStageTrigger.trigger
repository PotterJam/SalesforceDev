trigger SubscriptionStageTrigger on Subscription_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionStageHandler.handleAfterDelete(Trigger.old);
    }
}
