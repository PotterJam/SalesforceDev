trigger SurveyServiceTrigger on Survey_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyServiceHandler.handleAfterDelete(Trigger.old);
    }
}
