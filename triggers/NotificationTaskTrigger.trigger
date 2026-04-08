trigger NotificationTaskTrigger on Notification_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationTaskHandler.handleAfterDelete(Trigger.old);
    }
}
