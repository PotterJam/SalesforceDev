trigger WorkflowStreamTrigger on Workflow_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowStreamHandler.handleAfterDelete(Trigger.old);
    }
}
