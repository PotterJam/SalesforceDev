trigger WorkflowQueueTrigger on Workflow_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowQueueHandler.handleAfterDelete(Trigger.old);
    }
}
