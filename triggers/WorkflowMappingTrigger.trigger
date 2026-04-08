trigger WorkflowMappingTrigger on Workflow_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowMappingHandler.handleAfterDelete(Trigger.old);
    }
}
