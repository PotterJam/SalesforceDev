trigger ForecastResponseTrigger on Forecast_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastResponseHandler.handleAfterDelete(Trigger.old);
    }
}
