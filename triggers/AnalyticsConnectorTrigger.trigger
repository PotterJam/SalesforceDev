trigger AnalyticsConnectorTrigger on Analytics_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
