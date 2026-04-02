trigger AnalyticsEventTrigger on Analytics_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsEventHandler.handleAfterDelete(Trigger.old);
    }
}
