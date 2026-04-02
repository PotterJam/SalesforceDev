trigger PipelineTransformTrigger on Pipeline_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineTransformHandler.handleAfterDelete(Trigger.old);
    }
}
