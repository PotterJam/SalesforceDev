trigger TargetSnapshotTrigger on Target_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
