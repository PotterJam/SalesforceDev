trigger SurveyRelayTrigger on Survey_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyRelayHandler.handleAfterDelete(Trigger.old);
    }
}
