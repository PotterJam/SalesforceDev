trigger NotificationSummaryTrigger on Notification_Summary__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationSummaryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationSummaryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationSummaryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationSummaryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationSummaryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationSummaryHandler.handleAfterDelete(Trigger.old);
    }
}
