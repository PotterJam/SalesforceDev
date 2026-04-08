trigger LimitSnapshotTrigger on Limit_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
