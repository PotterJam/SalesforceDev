trigger MetricConnectorTrigger on Metric_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
