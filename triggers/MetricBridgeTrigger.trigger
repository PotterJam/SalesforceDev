trigger MetricBridgeTrigger on Metric_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
