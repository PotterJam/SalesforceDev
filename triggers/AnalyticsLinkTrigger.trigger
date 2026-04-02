trigger AnalyticsLinkTrigger on Analytics_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsLinkHandler.handleAfterDelete(Trigger.old);
    }
}
