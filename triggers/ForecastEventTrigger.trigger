trigger ForecastEventTrigger on Forecast_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastEventHandler.handleAfterDelete(Trigger.old);
    }
}
