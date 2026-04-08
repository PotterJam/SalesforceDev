trigger ApprovalSnapshotTrigger on Approval_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ApprovalSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ApprovalSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ApprovalSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ApprovalSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
