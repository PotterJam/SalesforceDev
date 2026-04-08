trigger WorkflowDeltaTrigger on Workflow_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
