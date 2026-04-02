trigger CeilingSnapshotTrigger on Ceiling_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CeilingSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CeilingSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CeilingSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CeilingSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
