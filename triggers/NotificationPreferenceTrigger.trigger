trigger NotificationPreferenceTrigger on Notification_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
