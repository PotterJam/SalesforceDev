trigger NotificationFeedTrigger on Notification_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationFeedHandler.handleAfterDelete(Trigger.old);
    }
}
