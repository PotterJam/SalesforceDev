trigger MetricSnapshotTrigger on Metric_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MetricSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MetricSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MetricSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MetricSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MetricSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
