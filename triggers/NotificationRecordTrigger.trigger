trigger NotificationRecordTrigger on Notification_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationRecordHandler.handleAfterDelete(Trigger.old);
    }
}
