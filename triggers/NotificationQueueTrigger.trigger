trigger NotificationQueueTrigger on Notification_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationQueueHandler.handleAfterDelete(Trigger.old);
    }
}
