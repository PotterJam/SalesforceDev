trigger SurveyHookTrigger on Survey_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyHookHandler.handleAfterDelete(Trigger.old);
    }
}
