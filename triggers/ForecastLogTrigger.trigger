trigger ForecastLogTrigger on Forecast_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastLogHandler.handleAfterDelete(Trigger.old);
    }
}
