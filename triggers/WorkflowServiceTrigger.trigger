trigger WorkflowServiceTrigger on Workflow_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowServiceHandler.handleAfterDelete(Trigger.old);
    }
}
