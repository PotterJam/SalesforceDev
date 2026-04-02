trigger SubscriptionBackupTrigger on Subscription_Backup__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SubscriptionBackupHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionBackupHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionBackupHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SubscriptionBackupHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SubscriptionBackupHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SubscriptionBackupHandler.handleAfterDelete(Trigger.old);
    }
}
