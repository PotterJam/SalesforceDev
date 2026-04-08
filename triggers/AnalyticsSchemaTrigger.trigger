trigger AnalyticsSchemaTrigger on Analytics_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
