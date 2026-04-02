trigger NotificationRequestTrigger on Notification_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationRequestHandler.handleAfterDelete(Trigger.old);
    }
}
