trigger AnalyticsResponseTrigger on Analytics_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsResponseHandler.handleAfterDelete(Trigger.old);
    }
}
