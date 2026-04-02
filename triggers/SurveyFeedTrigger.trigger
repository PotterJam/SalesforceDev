trigger SurveyFeedTrigger on Survey_Feed__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyFeedHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyFeedHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyFeedHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyFeedHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyFeedHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyFeedHandler.handleAfterDelete(Trigger.old);
    }
}
