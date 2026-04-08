trigger WorkflowSchemaTrigger on Workflow_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
