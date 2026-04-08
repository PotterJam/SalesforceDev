trigger WorkflowEntryTrigger on Workflow_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowEntryHandler.handleAfterDelete(Trigger.old);
    }
}
