trigger ForecastDeltaTrigger on Forecast_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
