trigger SurveyResponseTrigger on Survey_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyResponseHandler.handleAfterDelete(Trigger.old);
    }
}
