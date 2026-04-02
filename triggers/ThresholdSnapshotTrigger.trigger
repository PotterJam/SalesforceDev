trigger ThresholdSnapshotTrigger on Threshold_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ThresholdSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ThresholdSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ThresholdSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ThresholdSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
