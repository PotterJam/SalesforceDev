trigger SurveyRecordTrigger on Survey_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyRecordHandler.handleAfterDelete(Trigger.old);
    }
}
