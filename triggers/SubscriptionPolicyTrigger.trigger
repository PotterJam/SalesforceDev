trigger SubscriptionPolicyTrigger on Subscription_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
