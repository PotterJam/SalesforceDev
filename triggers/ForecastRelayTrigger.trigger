trigger ForecastRelayTrigger on Forecast_Relay__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastRelayHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastRelayHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastRelayHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastRelayHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastRelayHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastRelayHandler.handleAfterDelete(Trigger.old);
    }
}
