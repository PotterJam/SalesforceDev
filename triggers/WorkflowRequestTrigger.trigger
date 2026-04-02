trigger WorkflowRequestTrigger on Workflow_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRequestHandler.handleAfterDelete(Trigger.old);
    }
}
