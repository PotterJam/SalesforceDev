trigger DurationSnapshotTrigger on Duration_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
