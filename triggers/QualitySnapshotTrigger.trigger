trigger QualitySnapshotTrigger on Quality_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualitySnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualitySnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualitySnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualitySnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualitySnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualitySnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
