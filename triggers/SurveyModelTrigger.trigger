trigger SurveyModelTrigger on Survey_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyModelHandler.handleAfterDelete(Trigger.old);
    }
}
