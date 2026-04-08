trigger WorkflowModelTrigger on Workflow_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowModelHandler.handleAfterDelete(Trigger.old);
    }
}
