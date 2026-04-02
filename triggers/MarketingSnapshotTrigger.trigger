trigger MarketingSnapshotTrigger on Marketing_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
