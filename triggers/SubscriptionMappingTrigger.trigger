trigger SubscriptionMappingTrigger on Subscription_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionMappingHandler.handleAfterDelete(Trigger.old);
    }
}
