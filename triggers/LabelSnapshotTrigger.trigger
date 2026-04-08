trigger LabelSnapshotTrigger on Label_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
