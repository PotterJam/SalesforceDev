trigger PipelineProcessorTrigger on Pipeline_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
