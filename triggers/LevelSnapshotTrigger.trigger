trigger LevelSnapshotTrigger on Level_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
