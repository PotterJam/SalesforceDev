trigger WorkflowItemTrigger on Workflow_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowItemHandler.handleAfterDelete(Trigger.old);
    }
}
