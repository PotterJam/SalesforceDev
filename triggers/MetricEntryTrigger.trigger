trigger MetricEntryTrigger on Metric_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricEntryHandler.handleAfterDelete(Trigger.old);
    }
}
