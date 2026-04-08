trigger AnalyticsPluginTrigger on Analytics_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsPluginHandler.handleAfterDelete(Trigger.old);
    }
}
