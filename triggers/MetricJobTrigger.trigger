trigger MetricJobTrigger on Metric_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricJobHandler.handleAfterDelete(Trigger.old);
    }
}
