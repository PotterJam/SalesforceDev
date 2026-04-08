trigger SurveyPolicyTrigger on Survey_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
