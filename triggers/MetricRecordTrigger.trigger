trigger MetricRecordTrigger on Metric_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricRecordHandler.handleAfterDelete(Trigger.old);
    }
}
