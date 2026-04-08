trigger MetricFlowTrigger on Metric_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricFlowHandler.handleAfterDelete(Trigger.old);
    }
}
