trigger WorkflowLinkTrigger on Workflow_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowLinkHandler.handleAfterDelete(Trigger.old);
    }
}
