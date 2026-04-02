trigger SurveyProxyTrigger on Survey_Proxy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyProxyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyProxyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyProxyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyProxyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyProxyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyProxyHandler.handleAfterDelete(Trigger.old);
    }
}
