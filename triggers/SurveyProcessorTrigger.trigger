trigger SurveyProcessorTrigger on Survey_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
