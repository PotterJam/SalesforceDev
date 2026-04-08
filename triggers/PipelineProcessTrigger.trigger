trigger PipelineProcessTrigger on Pipeline_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineProcessHandler.handleAfterDelete(Trigger.old);
    }
}
