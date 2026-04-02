trigger NotificationBatchTrigger on Notification_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationBatchHandler.handleAfterDelete(Trigger.old);
    }
}
