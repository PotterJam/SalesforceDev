trigger NotificationMappingTrigger on Notification_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationMappingHandler.handleAfterDelete(Trigger.old);
    }
}
