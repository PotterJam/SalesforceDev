trigger SurveyFilterTrigger on Survey_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyFilterHandler.handleAfterDelete(Trigger.old);
    }
}
