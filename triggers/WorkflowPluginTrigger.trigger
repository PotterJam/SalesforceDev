trigger WorkflowPluginTrigger on Workflow_Plugin__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowPluginHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowPluginHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowPluginHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowPluginHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowPluginHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowPluginHandler.handleAfterDelete(Trigger.old);
    }
}
