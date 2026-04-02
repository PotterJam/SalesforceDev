trigger MetricControllerTrigger on Metric_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricControllerHandler.handleAfterDelete(Trigger.old);
    }
}
