trigger PipelineManagerTrigger on Pipeline_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineManagerHandler.handleAfterDelete(Trigger.old);
    }
}
