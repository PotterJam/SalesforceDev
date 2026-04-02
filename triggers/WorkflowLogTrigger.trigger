trigger WorkflowLogTrigger on Workflow_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowLogHandler.handleAfterDelete(Trigger.old);
    }
}
