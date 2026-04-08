trigger WorkflowFeedTrigger on Workflow_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowFeedHandler.handleAfterDelete(Trigger.old);
    }
}
