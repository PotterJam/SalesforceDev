trigger AnalyticsBridgeTrigger on Analytics_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AnalyticsBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AnalyticsBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AnalyticsBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AnalyticsBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
