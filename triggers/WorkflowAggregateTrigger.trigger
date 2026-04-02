trigger WorkflowAggregateTrigger on Workflow_Aggregate__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowAggregateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowAggregateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowAggregateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowAggregateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowAggregateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowAggregateHandler.handleAfterDelete(Trigger.old);
    }
}
