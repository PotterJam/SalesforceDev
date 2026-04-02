trigger WorkflowRegistryTrigger on Workflow_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
