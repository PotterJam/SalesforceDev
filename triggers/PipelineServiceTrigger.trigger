trigger PipelineServiceTrigger on Pipeline_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineServiceHandler.handleAfterDelete(Trigger.old);
    }
}
