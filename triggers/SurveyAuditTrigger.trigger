trigger SurveyAuditTrigger on Survey_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyAuditHandler.handleAfterDelete(Trigger.old);
    }
}
