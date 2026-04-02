trigger PipelineJobTrigger on Pipeline_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineJobHandler.handleAfterDelete(Trigger.old);
    }
}
