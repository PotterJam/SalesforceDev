trigger TierSnapshotTrigger on Tier_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
