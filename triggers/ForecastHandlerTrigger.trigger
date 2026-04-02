trigger ForecastHandlerTrigger on Forecast_Handler__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastHandlerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastHandlerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastHandlerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastHandlerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastHandlerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastHandlerHandler.handleAfterDelete(Trigger.old);
    }
}
