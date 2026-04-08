trigger MetricQueueTrigger on Metric_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricQueueHandler.handleAfterDelete(Trigger.old);
    }
}
