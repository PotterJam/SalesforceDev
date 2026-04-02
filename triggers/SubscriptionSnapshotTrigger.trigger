trigger SubscriptionSnapshotTrigger on Subscription_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
