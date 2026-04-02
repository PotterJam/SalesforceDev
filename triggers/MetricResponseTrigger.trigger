trigger MetricResponseTrigger on Metric_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricResponseHandler.handleAfterDelete(Trigger.old);
    }
}
