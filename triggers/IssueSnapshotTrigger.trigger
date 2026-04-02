trigger IssueSnapshotTrigger on Issue_Snapshot__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IssueSnapshotHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IssueSnapshotHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueSnapshotHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IssueSnapshotHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IssueSnapshotHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IssueSnapshotHandler.handleAfterDelete(Trigger.old);
    }
}
