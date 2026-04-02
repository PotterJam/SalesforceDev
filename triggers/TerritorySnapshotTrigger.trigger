trigger TerritorySnapshotTrigger on Territory_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TerritorySnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TerritorySnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritorySnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TerritorySnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TerritorySnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TerritorySnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
