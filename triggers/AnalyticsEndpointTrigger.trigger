trigger AnalyticsEndpointTrigger on Analytics_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
