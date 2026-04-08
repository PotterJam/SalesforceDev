trigger SurveyManagerTrigger on Survey_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyManagerHandler.handleAfterDelete(Trigger.old);
    }
}
