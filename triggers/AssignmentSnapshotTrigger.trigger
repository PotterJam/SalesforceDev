trigger AssignmentSnapshotTrigger on Assignment_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
