trigger SubscriptionRecordTrigger on Subscription_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionRecordHandler.handleAfterDelete(Trigger.old);
    }
}
