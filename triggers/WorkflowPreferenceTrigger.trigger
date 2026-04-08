trigger WorkflowPreferenceTrigger on Workflow_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) WorkflowPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) WorkflowPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) WorkflowPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) WorkflowPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
