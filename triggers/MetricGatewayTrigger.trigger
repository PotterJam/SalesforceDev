trigger MetricGatewayTrigger on Metric_Gateway__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricGatewayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricGatewayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricGatewayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricGatewayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricGatewayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricGatewayHandler.handleAfterDelete(Trigger.old);
    }
}
