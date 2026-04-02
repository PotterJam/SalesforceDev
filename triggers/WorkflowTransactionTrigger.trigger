trigger WorkflowTransactionTrigger on Workflow_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
