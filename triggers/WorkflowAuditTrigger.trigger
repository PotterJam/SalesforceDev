trigger WorkflowAuditTrigger on Workflow_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowAuditHandler.handleAfterDelete(Trigger.old);
    }
}
