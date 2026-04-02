trigger PipelineStoreTrigger on Pipeline_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineStoreHandler.handleAfterDelete(Trigger.old);
    }
}
