trigger SurveyEntryTrigger on Survey_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyEntryHandler.handleAfterDelete(Trigger.old);
    }
}
