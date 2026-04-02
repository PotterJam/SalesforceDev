trigger MetricManagerTrigger on Metric_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricManagerHandler.handleAfterDelete(Trigger.old);
    }
}
