trigger NotificationPlanTrigger on Notification_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationPlanHandler.handleAfterDelete(Trigger.old);
    }
}
