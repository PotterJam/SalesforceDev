trigger NotificationEventTrigger on Notification_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationEventHandler.handleAfterDelete(Trigger.old);
    }
}
