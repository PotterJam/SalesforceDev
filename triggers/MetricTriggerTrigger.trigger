trigger MetricTriggerTrigger on Metric_Trigger__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricTriggerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricTriggerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricTriggerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricTriggerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricTriggerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricTriggerHandler.handleAfterDelete(Trigger.old);
    }
}
