trigger ActualSnapshotTrigger on Actual_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
