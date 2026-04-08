trigger UtilizationSnapshotTrigger on Utilization_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
