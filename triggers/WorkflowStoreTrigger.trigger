trigger WorkflowStoreTrigger on Workflow_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowStoreHandler.handleAfterDelete(Trigger.old);
    }
}
