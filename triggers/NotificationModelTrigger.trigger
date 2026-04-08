trigger NotificationModelTrigger on Notification_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationModelHandler.handleAfterDelete(Trigger.old);
    }
}
