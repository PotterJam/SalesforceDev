trigger SurveyJobTrigger on Survey_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyJobHandler.handleAfterDelete(Trigger.old);
    }
}
