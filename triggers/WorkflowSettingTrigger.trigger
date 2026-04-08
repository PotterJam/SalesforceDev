trigger WorkflowSettingTrigger on Workflow_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowSettingHandler.handleAfterDelete(Trigger.old);
    }
}
