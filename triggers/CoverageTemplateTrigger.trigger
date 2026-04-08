trigger CoverageTemplateTrigger on Coverage_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CoverageTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CoverageTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CoverageTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CoverageTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
