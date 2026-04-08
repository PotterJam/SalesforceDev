trigger PipelineTaskTrigger on Pipeline_Task__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineTaskHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineTaskHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineTaskHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineTaskHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineTaskHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineTaskHandler.handleAfterDelete(Trigger.old);
    }
}
