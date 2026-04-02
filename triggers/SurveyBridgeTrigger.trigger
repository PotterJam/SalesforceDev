trigger SurveyBridgeTrigger on Survey_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
