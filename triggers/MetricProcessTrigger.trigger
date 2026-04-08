trigger MetricProcessTrigger on Metric_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricProcessHandler.handleAfterDelete(Trigger.old);
    }
}
