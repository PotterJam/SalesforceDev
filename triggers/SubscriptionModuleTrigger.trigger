trigger SubscriptionModuleTrigger on Subscription_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionModuleHandler.handleAfterDelete(Trigger.old);
    }
}
