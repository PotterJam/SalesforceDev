trigger SurveyStageTrigger on Survey_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyStageHandler.handleAfterDelete(Trigger.old);
    }
}
