trigger NotificationBridgeTrigger on Notification_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
