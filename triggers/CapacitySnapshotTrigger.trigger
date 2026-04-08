trigger CapacitySnapshotTrigger on Capacity_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CapacitySnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CapacitySnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacitySnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CapacitySnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CapacitySnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CapacitySnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
