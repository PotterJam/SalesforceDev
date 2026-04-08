trigger ResourceSnapshotTrigger on Resource_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
