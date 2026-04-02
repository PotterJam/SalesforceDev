trigger PipelineModuleTrigger on Pipeline_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineModuleHandler.handleAfterDelete(Trigger.old);
    }
}
