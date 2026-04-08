trigger NotificationServiceTrigger on Notification_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationServiceHandler.handleAfterDelete(Trigger.old);
    }
}
