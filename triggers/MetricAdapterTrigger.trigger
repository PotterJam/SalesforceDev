trigger MetricAdapterTrigger on Metric_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
