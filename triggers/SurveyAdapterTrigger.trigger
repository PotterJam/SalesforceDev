trigger SurveyAdapterTrigger on Survey_Adapter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyAdapterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyAdapterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyAdapterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyAdapterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyAdapterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyAdapterHandler.handleAfterDelete(Trigger.old);
    }
}
