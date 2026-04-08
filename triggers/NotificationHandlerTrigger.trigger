trigger NotificationHandlerTrigger on Notification_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
