trigger IndexSnapshotTrigger on Index_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
