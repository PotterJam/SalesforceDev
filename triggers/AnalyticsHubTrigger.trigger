trigger AnalyticsHubTrigger on Analytics_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsHubHandler.handleAfterDelete(Trigger.old);
    }
}
