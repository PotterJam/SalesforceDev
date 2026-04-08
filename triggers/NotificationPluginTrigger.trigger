trigger NotificationPluginTrigger on Notification_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationPluginHandler.handleAfterDelete(Trigger.old);
    }
}
