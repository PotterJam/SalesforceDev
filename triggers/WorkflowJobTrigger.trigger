trigger WorkflowJobTrigger on Workflow_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowJobHandler.handleAfterDelete(Trigger.old);
    }
}
