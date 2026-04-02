trigger AnalyticsHandlerTrigger on Analytics_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
