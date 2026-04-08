trigger NotificationResponseTrigger on Notification_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationResponseHandler.handleAfterDelete(Trigger.old);
    }
}
