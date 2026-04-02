trigger MilestoneTemplateTrigger on Milestone_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MilestoneTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MilestoneTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MilestoneTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MilestoneTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
