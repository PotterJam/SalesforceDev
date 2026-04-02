trigger MetricHookTrigger on Metric_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricHookHandler.handleAfterDelete(Trigger.old);
    }
}
