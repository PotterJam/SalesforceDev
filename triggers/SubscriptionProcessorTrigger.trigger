trigger SubscriptionProcessorTrigger on Subscription_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
