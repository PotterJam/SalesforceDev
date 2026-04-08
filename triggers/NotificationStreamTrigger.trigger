trigger NotificationStreamTrigger on Notification_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationStreamHandler.handleAfterDelete(Trigger.old);
    }
}
