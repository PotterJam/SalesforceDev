trigger ForecastStreamTrigger on Forecast_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastStreamHandler.handleAfterDelete(Trigger.old);
    }
}
