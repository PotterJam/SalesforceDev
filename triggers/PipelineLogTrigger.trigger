trigger PipelineLogTrigger on Pipeline_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineLogHandler.handleAfterDelete(Trigger.old);
    }
}
