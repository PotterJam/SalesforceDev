trigger RatingSnapshotTrigger on Rating_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
