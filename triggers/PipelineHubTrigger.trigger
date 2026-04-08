trigger PipelineHubTrigger on Pipeline_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineHubHandler.handleAfterDelete(Trigger.old);
    }
}
