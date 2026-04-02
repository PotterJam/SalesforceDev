trigger SubscriptionDetailTrigger on Subscription_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionDetailHandler.handleAfterDelete(Trigger.old);
    }
}
