trigger WorkflowTrackerTrigger on Workflow_Tracker__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowTrackerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowTrackerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowTrackerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowTrackerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowTrackerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowTrackerHandler.handleAfterDelete(Trigger.old);
    }
}
