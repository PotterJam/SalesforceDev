trigger WorkflowModuleTrigger on Workflow_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowModuleHandler.handleAfterDelete(Trigger.old);
    }
}
