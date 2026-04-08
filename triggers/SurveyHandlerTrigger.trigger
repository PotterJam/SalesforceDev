trigger SurveyHandlerTrigger on Survey_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
