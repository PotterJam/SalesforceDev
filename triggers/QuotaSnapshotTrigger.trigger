trigger QuotaSnapshotTrigger on Quota_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
