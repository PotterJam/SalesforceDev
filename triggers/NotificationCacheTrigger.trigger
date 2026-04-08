trigger NotificationCacheTrigger on Notification_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationCacheHandler.handleAfterDelete(Trigger.old);
    }
}
