trigger NotificationDeltaTrigger on Notification_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
