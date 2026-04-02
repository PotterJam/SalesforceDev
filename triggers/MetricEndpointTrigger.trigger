trigger MetricEndpointTrigger on Metric_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
