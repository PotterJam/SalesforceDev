trigger TagSnapshotTrigger on Tag_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
