trigger AnalyticsProxyTrigger on Analytics_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsProxyHandler.handleAfterDelete(Trigger.old);
    }
}
