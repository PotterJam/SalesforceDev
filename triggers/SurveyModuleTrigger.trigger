trigger SurveyModuleTrigger on Survey_Module__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyModuleHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyModuleHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyModuleHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyModuleHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyModuleHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyModuleHandler.handleAfterDelete(Trigger.old);
    }
}
