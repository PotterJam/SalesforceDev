trigger SurveyTemplateTrigger on Survey_Template__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyTemplateHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyTemplateHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyTemplateHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyTemplateHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyTemplateHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyTemplateHandler.handleAfterDelete(Trigger.old);
    }
}
