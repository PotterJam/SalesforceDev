trigger DeliverableSnapshotTrigger on Deliverable_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
