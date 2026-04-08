trigger ForecastProcessorTrigger on Forecast_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ForecastProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ForecastProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ForecastProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ForecastProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
