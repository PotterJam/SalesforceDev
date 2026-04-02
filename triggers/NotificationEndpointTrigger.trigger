trigger NotificationEndpointTrigger on Notification_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
