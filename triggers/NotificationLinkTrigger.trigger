trigger NotificationLinkTrigger on Notification_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationLinkHandler.handleAfterDelete(Trigger.old);
    }
}
