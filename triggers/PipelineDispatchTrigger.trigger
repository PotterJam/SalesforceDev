trigger PipelineDispatchTrigger on Pipeline_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
