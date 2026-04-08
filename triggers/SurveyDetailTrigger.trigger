trigger SurveyDetailTrigger on Survey_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyDetailHandler.handleAfterDelete(Trigger.old);
    }
}
