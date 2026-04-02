trigger ForecastRequestTrigger on Forecast_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastRequestHandler.handleAfterDelete(Trigger.old);
    }
}
