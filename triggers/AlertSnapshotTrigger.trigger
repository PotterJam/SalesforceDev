trigger AlertSnapshotTrigger on Alert_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
