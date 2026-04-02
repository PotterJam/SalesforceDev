trigger WorkflowBindingTrigger on Workflow_Binding__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowBindingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowBindingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowBindingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowBindingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowBindingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowBindingHandler.handleAfterDelete(Trigger.old);
    }
}
