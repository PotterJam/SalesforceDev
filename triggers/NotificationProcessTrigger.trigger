trigger NotificationProcessTrigger on Notification_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationProcessHandler.handleAfterDelete(Trigger.old);
    }
}
