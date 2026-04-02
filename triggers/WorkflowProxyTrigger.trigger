trigger WorkflowProxyTrigger on Workflow_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowProxyHandler.handleAfterDelete(Trigger.old);
    }
}
