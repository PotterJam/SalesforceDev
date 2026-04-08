trigger NotificationTransactionTrigger on Notification_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) NotificationTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) NotificationTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) NotificationTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) NotificationTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
