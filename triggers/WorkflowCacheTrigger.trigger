trigger WorkflowCacheTrigger on Workflow_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowCacheHandler.handleAfterDelete(Trigger.old);
    }
}
