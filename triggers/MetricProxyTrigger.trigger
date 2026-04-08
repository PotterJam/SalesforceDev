trigger MetricProxyTrigger on Metric_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricProxyHandler.handleAfterDelete(Trigger.old);
    }
}
