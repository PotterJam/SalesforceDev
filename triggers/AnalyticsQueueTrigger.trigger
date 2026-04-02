trigger AnalyticsQueueTrigger on Analytics_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsQueueHandler.handleAfterDelete(Trigger.old);
    }
}
