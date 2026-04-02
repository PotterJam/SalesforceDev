trigger AnalyticsDispatchTrigger on Analytics_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
