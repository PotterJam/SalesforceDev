trigger MetricRouteTrigger on Metric_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricRouteHandler.handleAfterDelete(Trigger.old);
    }
}
