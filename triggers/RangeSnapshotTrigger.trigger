trigger RangeSnapshotTrigger on Range_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RangeSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RangeSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RangeSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RangeSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RangeSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
