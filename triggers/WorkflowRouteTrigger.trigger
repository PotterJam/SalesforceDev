trigger WorkflowRouteTrigger on Workflow_Route__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowRouteHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRouteHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRouteHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowRouteHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRouteHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRouteHandler.handleAfterDelete(Trigger.old);
    }
}
