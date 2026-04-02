trigger ScoreSnapshotTrigger on Score_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScoreSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScoreSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScoreSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScoreSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
