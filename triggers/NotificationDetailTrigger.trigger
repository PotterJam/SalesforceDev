trigger NotificationDetailTrigger on Notification_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationDetailHandler.handleAfterDelete(Trigger.old);
    }
}
