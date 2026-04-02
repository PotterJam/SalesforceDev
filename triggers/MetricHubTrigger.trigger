trigger MetricHubTrigger on Metric_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricHubHandler.handleAfterDelete(Trigger.old);
    }
}
