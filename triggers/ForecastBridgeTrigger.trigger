trigger ForecastBridgeTrigger on Forecast_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
