trigger MetricArchiveTrigger on Metric_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
