trigger PipelineTemplateTrigger on Pipeline_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
