trigger ProcurementSnapshotTrigger on Procurement_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
