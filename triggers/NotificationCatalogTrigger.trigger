trigger NotificationCatalogTrigger on Notification_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
