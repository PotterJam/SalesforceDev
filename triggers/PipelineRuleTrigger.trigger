trigger PipelineRuleTrigger on Pipeline_Rule__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PipelineRuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineRuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineRuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PipelineRuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PipelineRuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PipelineRuleHandler.handleAfterDelete(Trigger.old);
    }
}
