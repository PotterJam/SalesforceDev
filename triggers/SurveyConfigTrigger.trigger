trigger SurveyConfigTrigger on Survey_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyConfigHandler.handleAfterDelete(Trigger.old);
    }
}
