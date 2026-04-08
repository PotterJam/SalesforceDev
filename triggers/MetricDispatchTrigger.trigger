trigger MetricDispatchTrigger on Metric_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
