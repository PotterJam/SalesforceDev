trigger NotificationRelayTrigger on Notification_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationRelayHandler.handleAfterDelete(Trigger.old);
    }
}
