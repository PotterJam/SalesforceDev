trigger AnalyticsServiceTrigger on Analytics_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsServiceHandler.handleAfterDelete(Trigger.old);
    }
}
