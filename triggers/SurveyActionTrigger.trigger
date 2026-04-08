trigger SurveyActionTrigger on Survey_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyActionHandler.handleAfterDelete(Trigger.old);
    }
}
