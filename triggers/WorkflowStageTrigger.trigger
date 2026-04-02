trigger WorkflowStageTrigger on Workflow_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowStageHandler.handleAfterDelete(Trigger.old);
    }
}
