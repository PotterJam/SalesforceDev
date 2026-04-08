trigger WorkflowArchiveTrigger on Workflow_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
