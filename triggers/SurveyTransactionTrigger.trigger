trigger SurveyTransactionTrigger on Survey_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
