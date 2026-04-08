trigger SurveyPlanTrigger on Survey_Plan__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyPlanHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyPlanHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyPlanHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyPlanHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyPlanHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyPlanHandler.handleAfterDelete(Trigger.old);
    }
}
