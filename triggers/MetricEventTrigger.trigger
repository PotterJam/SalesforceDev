trigger MetricEventTrigger on Metric_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricEventHandler.handleAfterDelete(Trigger.old);
    }
}
