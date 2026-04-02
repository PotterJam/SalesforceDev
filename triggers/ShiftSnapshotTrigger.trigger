trigger ShiftSnapshotTrigger on Shift_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ShiftSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ShiftSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ShiftSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ShiftSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
