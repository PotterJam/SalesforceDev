trigger MetricRequestTrigger on Metric_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricRequestHandler.handleAfterDelete(Trigger.old);
    }
}
