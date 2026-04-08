trigger MetricDeltaTrigger on Metric_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
