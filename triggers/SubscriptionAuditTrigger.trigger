trigger SubscriptionAuditTrigger on Subscription_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionAuditHandler.handleAfterDelete(Trigger.old);
    }
}
