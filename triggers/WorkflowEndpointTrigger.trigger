trigger WorkflowEndpointTrigger on Workflow_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
