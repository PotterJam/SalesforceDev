trigger NotificationStoreTrigger on Notification_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationStoreHandler.handleAfterDelete(Trigger.old);
    }
}
