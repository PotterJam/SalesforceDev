trigger RatioSnapshotTrigger on Ratio_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
