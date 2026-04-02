trigger WorkflowViewTrigger on Workflow_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowViewHandler.handleAfterDelete(Trigger.old);
    }
}
