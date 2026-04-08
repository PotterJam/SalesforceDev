trigger SupportSnapshotTrigger on Support_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
