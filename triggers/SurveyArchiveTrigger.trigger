trigger SurveyArchiveTrigger on Survey_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
