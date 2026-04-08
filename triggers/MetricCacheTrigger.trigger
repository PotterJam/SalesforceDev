trigger MetricCacheTrigger on Metric_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricCacheHandler.handleAfterDelete(Trigger.old);
    }
}
