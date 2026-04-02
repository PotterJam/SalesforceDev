trigger WorkflowHubTrigger on Workflow_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowHubHandler.handleAfterDelete(Trigger.old);
    }
}
