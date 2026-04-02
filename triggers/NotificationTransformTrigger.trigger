trigger NotificationTransformTrigger on Notification_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationTransformHandler.handleAfterDelete(Trigger.old);
    }
}
