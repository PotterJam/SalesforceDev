trigger WorkflowResponseTrigger on Workflow_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowResponseHandler.handleAfterDelete(Trigger.old);
    }
}
