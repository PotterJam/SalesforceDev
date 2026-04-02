trigger ProjectSnapshotTrigger on Project_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
