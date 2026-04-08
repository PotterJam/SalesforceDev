trigger SurveyLogTrigger on Survey_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyLogHandler.handleAfterDelete(Trigger.old);
    }
}
