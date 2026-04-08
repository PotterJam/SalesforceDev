trigger PhaseSnapshotTrigger on Phase_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PhaseSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PhaseSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PhaseSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PhaseSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
