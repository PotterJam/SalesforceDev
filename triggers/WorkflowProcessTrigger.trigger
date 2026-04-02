trigger WorkflowProcessTrigger on Workflow_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowProcessHandler.handleAfterDelete(Trigger.old);
    }
}
