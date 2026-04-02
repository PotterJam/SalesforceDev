trigger SurveyQueueTrigger on Survey_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyQueueHandler.handleAfterDelete(Trigger.old);
    }
}
