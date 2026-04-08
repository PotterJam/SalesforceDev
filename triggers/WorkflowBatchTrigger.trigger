trigger WorkflowBatchTrigger on Workflow_Batch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowBatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowBatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowBatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowBatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowBatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowBatchHandler.handleAfterDelete(Trigger.old);
    }
}
