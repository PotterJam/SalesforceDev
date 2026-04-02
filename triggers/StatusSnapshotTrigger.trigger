trigger StatusSnapshotTrigger on Status_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
