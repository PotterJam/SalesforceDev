trigger PipelineSettingTrigger on Pipeline_Setting__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineSettingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineSettingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineSettingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineSettingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineSettingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineSettingHandler.handleAfterDelete(Trigger.old);
    }
}
