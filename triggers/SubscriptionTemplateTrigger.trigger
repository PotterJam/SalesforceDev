trigger SubscriptionTemplateTrigger on Subscription_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
