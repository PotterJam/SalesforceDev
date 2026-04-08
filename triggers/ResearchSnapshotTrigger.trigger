trigger ResearchSnapshotTrigger on Research_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
