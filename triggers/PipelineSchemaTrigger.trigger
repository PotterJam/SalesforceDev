trigger PipelineSchemaTrigger on Pipeline_Schema__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineSchemaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineSchemaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineSchemaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineSchemaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineSchemaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineSchemaHandler.handleAfterDelete(Trigger.old);
    }
}
