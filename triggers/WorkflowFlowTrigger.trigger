trigger WorkflowFlowTrigger on Workflow_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowFlowHandler.handleAfterDelete(Trigger.old);
    }
}
