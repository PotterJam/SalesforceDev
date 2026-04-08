trigger WorkflowRecordTrigger on Workflow_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowRecordHandler.handleAfterDelete(Trigger.old);
    }
}
