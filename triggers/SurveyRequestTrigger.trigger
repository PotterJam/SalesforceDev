trigger SurveyRequestTrigger on Survey_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyRequestHandler.handleAfterDelete(Trigger.old);
    }
}
