trigger SurveyRegistryTrigger on Survey_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
