trigger NotificationProcessorTrigger on Notification_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
