trigger WorkflowRelayTrigger on Workflow_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRelayHandler.handleAfterDelete(Trigger.old);
    }
}
