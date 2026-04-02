trigger WorkflowHookTrigger on Workflow_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowHookHandler.handleAfterDelete(Trigger.old);
    }
}
