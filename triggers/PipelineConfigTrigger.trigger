trigger PipelineConfigTrigger on Pipeline_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineConfigHandler.handleAfterDelete(Trigger.old);
    }
}
