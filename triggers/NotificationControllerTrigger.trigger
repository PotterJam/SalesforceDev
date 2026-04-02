trigger NotificationControllerTrigger on Notification_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationControllerHandler.handleAfterDelete(Trigger.old);
    }
}
