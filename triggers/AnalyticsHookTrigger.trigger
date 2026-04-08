trigger AnalyticsHookTrigger on Analytics_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsHookHandler.handleAfterDelete(Trigger.old);
    }
}
