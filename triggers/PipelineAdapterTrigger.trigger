trigger PipelineAdapterTrigger on Pipeline_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
