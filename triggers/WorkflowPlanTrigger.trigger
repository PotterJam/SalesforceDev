trigger WorkflowPlanTrigger on Workflow_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowPlanHandler.handleAfterDelete(Trigger.old);
    }
}
