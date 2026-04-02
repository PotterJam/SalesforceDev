trigger SurveyPreferenceTrigger on Survey_Preference__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyPreferenceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyPreferenceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyPreferenceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyPreferenceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyPreferenceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyPreferenceHandler.handleAfterDelete(Trigger.old);
    }
}
