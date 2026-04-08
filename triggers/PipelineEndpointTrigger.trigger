trigger PipelineEndpointTrigger on Pipeline_Endpoint__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineEndpointHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineEndpointHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineEndpointHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineEndpointHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineEndpointHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineEndpointHandler.handleAfterDelete(Trigger.old);
    }
}
