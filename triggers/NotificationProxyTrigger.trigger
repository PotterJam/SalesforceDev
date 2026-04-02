trigger NotificationProxyTrigger on Notification_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationProxyHandler.handleAfterDelete(Trigger.old);
    }
}
