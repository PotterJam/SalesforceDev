trigger SurveyMappingTrigger on Survey_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyMappingHandler.handleAfterDelete(Trigger.old);
    }
}
