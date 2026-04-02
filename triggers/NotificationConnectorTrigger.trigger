trigger NotificationConnectorTrigger on Notification_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
