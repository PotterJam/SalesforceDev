trigger MetricNodeTrigger on Metric_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricNodeHandler.handleAfterDelete(Trigger.old);
    }
}
