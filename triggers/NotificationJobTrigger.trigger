trigger NotificationJobTrigger on Notification_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationJobHandler.handleAfterDelete(Trigger.old);
    }
}
