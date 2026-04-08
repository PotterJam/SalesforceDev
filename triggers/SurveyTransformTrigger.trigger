trigger SurveyTransformTrigger on Survey_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyTransformHandler.handleAfterDelete(Trigger.old);
    }
}
