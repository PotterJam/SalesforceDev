trigger WorkflowProcessorTrigger on Workflow_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
